import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:thingsboard_app/core/auth/noauth/di/noauth_di.dart';
import 'package:thingsboard_app/core/auth/noauth/presentation/bloc/bloc.dart';
import 'package:thingsboard_app/core/auth/noauth/presentation/widgets/noauth_loading_widget.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';

class SwitchEndpointNoAuthView extends StatefulWidget {
  SwitchEndpointNoAuthView({
    required this.tbContext,
    required this.arguments,
  });

  final Map<String, dynamic>? arguments;
  final TbContext tbContext;

  @override
  State<StatefulWidget> createState() => _SwitchEndpointNoAuthViewState();
}

class _SwitchEndpointNoAuthViewState extends State<SwitchEndpointNoAuthView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NoAuthBloc>.value(
      value: GetIt.instance()
        ..add(
          SwitchToAnotherEndpointEvent(
            parameters: widget.arguments,
          ),
        ),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: BlocConsumer<NoAuthBloc, NoAuthState>(
            listener: (context, state) {
              if (state is NoAuthErrorState) {
                widget.tbContext.pop();
              } else if (state is NoAuthDoneState) {
                widget.tbContext.router.navigateTo(
                  context,
                  '/home',
                  replace: true,
                  maintainState: false,
                );
              }
            },
            builder: (context, state) {
              switch (state) {
                case NoAuthLoadingState():
                  return const NoAuthLoadingWidget();

                case NoAuthWipState():
                  return Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      const NoAuthLoadingWidget(),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 2 + 80,
                        child: BlocBuilder<NoAuthBloc, NoAuthState>(
                          buildWhen: (_, state) => state is NoAuthWipState,
                          builder: (context, state) {
                            if (state is NoAuthWipState) {
                              return FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  state.currentStateMessage,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              );
                            }

                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    ],
                  );

                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    NoAuthDi.init(tbContext: widget.tbContext);
    super.initState();
  }

  @override
  void dispose() {
    GetIt.instance<NoAuthBloc>().close();
    NoAuthDi.dispose();
    super.dispose();
  }
}
