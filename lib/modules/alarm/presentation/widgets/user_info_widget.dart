import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    required this.id,
    required this.avatar,
    required this.name,
    this.email = '',
    this.showEmail = false,
    this.onUserTap,
    super.key,
  });

  final String id;
  final Widget avatar;
  final String name;
  final String email;
  final bool showEmail;
  final Function(String)? onUserTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onUserTap?.call(id),
      child: Row(
        children: [
          avatar,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Visibility(
                  visible: showEmail,
                  child: Text(
                    email,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.38),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
