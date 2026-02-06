import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/modules/notification/service/notifications_local_service.dart';

class NavigationBadgeWidget extends StatelessWidget {
  const NavigationBadgeWidget({super.key, required this.isLarge});
  final bool isLarge;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: NotificationsLocalService.notificationsNumberStream.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data! > 0) {
          if (isLarge) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              alignment: Alignment.center,
              height: 18,
              width: 18,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  '${snapshot.data! > 99 ? '99+' : snapshot.data}',
                  textAlign: TextAlign.center,
                  style: TbTextStyles.labelSmall.copyWith(color: Colors.white),
                ),
              ),
            );
          } else {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              alignment: Alignment.center,
              height: 8,
              width: 8,
            );
          }
        }

        return SizedBox(width: isLarge ? 18 : 8, height: isLarge ? 18 : 8);
      },
    );
  }
}
