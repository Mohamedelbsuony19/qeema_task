import 'package:flutter/material.dart';
import 'package:qeema_task/core/constants/local_keys.dart';

class HeaderContent extends StatelessWidget {
  const HeaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.logo, height: 50),
        const Spacer(),
        const Text('Menu', style: TextStyle(color: Colors.white, fontSize: 18)),
      ],
    );
  }
}
