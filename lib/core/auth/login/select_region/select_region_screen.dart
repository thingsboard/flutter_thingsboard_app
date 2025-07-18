import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/auth/login/select_region/model/region.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class SelectRegionScreen extends TbContextStatelessWidget {
  SelectRegionScreen(super.tbContext, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SvgPicture.asset(ThingsboardImage.thingsboardBigLogo),
            const SizedBox(height: 166),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Text(
                      S.of(context).selectRegion,
                      style: TbTextStyles.titleMedium.copyWith(
                        color: Colors.black.withValues(alpha: .76),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          getIt<IEndpointService>().setRegion(
                            Region.northAmerica,
                          );
                          getIt<ThingsboardAppRouter>().navigateTo('/');
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          textStyle: TbTextStyles.labelMedium,
                        ),
                        child: Text(S.of(context).northAmerica),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          getIt<IEndpointService>().setRegion(Region.europe);
                          getIt<ThingsboardAppRouter>().navigateTo('/');
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          textStyle: TbTextStyles.labelMedium,
                        ),
                        child: Text(S.of(context).europe),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
