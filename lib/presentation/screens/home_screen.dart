import 'package:flutter/material.dart';

import 'widgets/prdouct_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ItemsTab(),
                Center(
                    child: Text('Pricing Screen',
                        style: TextStyle(color: Colors.white, fontSize: 24))),
                Center(
                    child: Text('Info Screen',
                        style: TextStyle(color: Colors.white, fontSize: 24))),
                Center(
                    child: Text('Tasks Screen',
                        style: TextStyle(color: Colors.white, fontSize: 24))),
                Center(
                    child: Text('Contact Me Screen',
                        style: TextStyle(color: Colors.white, fontSize: 24))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
          Image.asset('assets/images/logo1.png', height: w * 0.08),
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
          backgroundImage: AssetImage('assets/images/person.png'),
          radius: 20,
        ),
      ],
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: HeaderContent(),
          ),
          DrawerItem(title: 'Items', index: 0),
          DrawerItem(title: 'Pricing', index: 1),
          DrawerItem(title: 'Info', index: 2),
          DrawerItem(title: 'Tasks', index: 3),
          DrawerItem(title: 'Contact Me', index: 4),
        ],
      ),
    );
  }
}

class HeaderContent extends StatelessWidget {
  const HeaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/logo1.png', height: 50),
        const Spacer(),
        const Text('Menu', style: TextStyle(color: Colors.white, fontSize: 18)),
      ],
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final int index;

  const DrawerItem({super.key, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        final HomeScreenState? state =
            context.findAncestorStateOfType<HomeScreenState>();
        state?._tabController.index = index;
        Navigator.pop(context);
        state?.setState(() {});
      },
    );
  }
}

class ItemsTab extends StatelessWidget {
  const ItemsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          children: const [
            ListCard(imageUrl: 'assets/images/bg2.png'),
            ListCard(imageUrl: 'assets/images/bg2.png'),
            ListCard(imageUrl: 'assets/images/bg2.png'),
          ],
        );
      },
    );
  }
}
