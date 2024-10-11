import 'package:flutter/material.dart';
import 'package:qeema_task/core/constants/local_keys.dart';

class SettingsAndNotifications extends StatelessWidget {
  const SettingsAndNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon:
              const Icon(Icons.notifications_none_rounded, color: Colors.white),
          onPressed: () {},
        ),
        const CircleAvatar(
          backgroundImage: AssetImage(AppConstants.logo),
          radius: 20,
        ),
      ],
    );
  }
}
