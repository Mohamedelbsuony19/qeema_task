import 'package:flutter/material.dart';
import 'package:qeema_task/core/constants/local_keys.dart';
import 'package:qeema_task/presentation/blocs/product/product_bloc.dart';

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
          onPressed: () {
            const ProductEvent.getAllProducts();
          },
        ),
        const CircleAvatar(
          backgroundImage: AssetImage(Assets.logo),
          radius: 20,
        ),
      ],
    );
  }
}
