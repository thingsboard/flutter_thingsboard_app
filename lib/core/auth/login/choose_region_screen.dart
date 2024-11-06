import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/core/auth/login/region.dart';
import 'package:thingsboard_app/core/auth/login/region_widget.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class ChooseRegionScreen extends TbContextStatelessWidget {
  ChooseRegionScreen(
    super.tbContext, {
    required this.nASelected,
    required this.europeSelected,
    super.key,
  });

  final bool nASelected;
  final bool europeSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppBar(
        tbContext,
        title: Text(
          S.of(context).chooseRegion,
          style: TbTextStyles.titleXs.copyWith(
            color: Colors.black.withOpacity(.87),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegionWidget(
                title: S.of(context).northAmerica,
                subTitle: S.of(context).northAmericaRegionShort,
                selected: nASelected,
                onTap: () {
                  getIt<IEndpointService>().setRegion(Region.northAmerica);
                  navigateTo('/', replace: true);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: RegionWidget(
                  title: S.of(context).europe,
                  subTitle: S.of(context).europeRegionShort,
                  selected: europeSelected,
                  onTap: () {
                    getIt<IEndpointService>().setRegion(Region.europe);
                    navigateTo('/', replace: true);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
