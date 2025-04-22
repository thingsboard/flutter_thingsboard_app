import 'package:flutter/material.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/utils/ui/text_extension.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    required this.id,
    required this.avatar,
    required this.name,
    this.email = '',
    this.showEmail = false,
    this.searchText,
    this.onUserTap,
    super.key,
  });

  final String id;
  final Widget avatar;
  final String name;
  final String email;
  final bool showEmail;
  final String? searchText;
  final Function(String)? onUserTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      // To disable the gesture detection tap handler, and allow the parent tap handler to process the event.
      onTap: onUserTap != null ? () => onUserTap!.call(id) : null,
      child: Row(
        children: [
          avatar,
          const SizedBox(width: 6),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                  ).boldSubString(
                    searchText ?? '',
                    highlightedColor: Theme.of(context).primaryColor,
                    regularColor: Colors.black.withOpacity(.76),
                  ),
                  const SizedBox(height: 4),
                  Visibility(
                    visible: showEmail,
                    child: Text(
                      email,
                    ).boldSubString(
                      searchText ?? '',
                      highlightedTextStyle: TbTextStyles.bodyMedium.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                      regularTextStyle: TbTextStyles.bodyMedium.copyWith(
                        color: Colors.black.withOpacity(.38),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
