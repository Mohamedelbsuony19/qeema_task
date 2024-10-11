import 'package:flutter/material.dart';
import 'package:qeema_task/core/constants/app_constants.dart';

class HeaderContent extends StatelessWidget {
  const HeaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AppConstants.logo, height: 50),
        const Spacer(),
        const Text('Menu', style: TextStyle(color: Colors.white, fontSize: 18)),
      ],
    );
  }
}
