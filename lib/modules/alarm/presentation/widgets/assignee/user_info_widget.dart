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
      // To disable the gesture detection tap handler, and allow the parent tap handler to process the event.
      onTap: onUserTap != null ? () => onUserTap!.call(id) : null,
      child: Row(
        children: [
          avatar,
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
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Visibility(
                    visible: showEmail,
                    child: Text(
                      email,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.38),
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
