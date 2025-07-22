import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/alarms_list.dart';
import 'package:thingsboard_app/modules/alarm/di/alarms_di.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarms_bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarms_states.dart';
import 'package:thingsboard_app/modules/alarm/presentation/view/alarms_filter_page.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class AlarmsPage extends TbContextWidget {
  AlarmsPage(
    super.tbContext, {
    this.searchMode = false,
    super.key,
  });

  final bool searchMode;

  @override
  State<StatefulWidget> createState() => _AlarmsPageState();
}

class _AlarmsPageState extends TbContextState<AlarmsPage>
    with AutomaticKeepAliveClientMixin<AlarmsPage> {
  final _preloadPageCtrl = PreloadPageController();
  final diScopeKey = UniqueKey();
  final typesScopeName = UniqueKey();
  final assigneeScopeName = UniqueKey();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider<AlarmBloc>.value(
      value: getIt(),
      child: PreloadPageView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return Scaffold(
                appBar: TbAppBar(
                  tbContext,
                  title: Text(
                    S.of(context).alarms(2),
                    style: TbTextStyles.titleXs,
                  ),
                  actions: [
                    Stack(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.filter_list),
                          onPressed: () {
                            _preloadPageCtrl.animateToPage(
                              1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                        BlocBuilder<AlarmBloc, AlarmsState>(
                          builder: (context, state) {
                            if (state is AlarmsFilterActivatedState) {
                              return Positioned(
                                right: 13,
                                top: 13,
                                child: Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              );
                            }

                            return const SizedBox.shrink();
                          },
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        getIt<ThingsboardAppRouter>()
                            // translate-me-ignore-next-line
                            .navigateTo('/alarms?search=true');
                      },
                    ),
                  ],
                ),
                body: AlarmsList(tbContext: tbContext),
              );

            case 1:
              return AlarmsFilterPage(
                tbContext,
                pageController: _preloadPageCtrl,
              );
          }

          return const SizedBox.shrink();
        },
        controller: _preloadPageCtrl,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  @override
  void initState() {
    AlarmsDi.init(
      diScopeKey.toString(),
      tbClient: widget.tbContext.tbClient,
      typesScopeName: typesScopeName.toString(),
      assigneeScopeName: assigneeScopeName.toString(),
    );
    super.initState();
  }

  @override
  void dispose() {
    AlarmsDi.dispose(
      diScopeKey.toString(),
      typesScopeName: typesScopeName.toString(),
      assigneeScopeName: assigneeScopeName.toString(),
    );
    super.dispose();
  }
}
