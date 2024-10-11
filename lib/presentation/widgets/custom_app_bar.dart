import 'package:flutter/material.dart';
import 'package:qeema_task/presentation/widgets/settings_and_notifications.dart';

import '../../core/constants/app_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    const Color primaryColor = Color(0xFFFFC268);
    const Color secondaryColor = Color(0xFF999999);

    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: Colors.black,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      title: Row(
        children: [
          Image.asset(AppConstants.logo, height: w * 0.08),
          const Spacer(),
          if (w > 800)
            const Expanded(
              child: TabBar(
                indicatorColor: primaryColor,
                unselectedLabelColor: secondaryColor,
                labelStyle: TextStyle(color: primaryColor),
                tabs: [
                  Tab(text: "Items"),
                  Tab(text: "Pricing"),
                  Tab(text: "Info"),
                  Tab(text: "Tasks"),
                  Tab(text: "Contact Me"),
                ],
              ),
            ),
          const SettingsAndNotifications(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
