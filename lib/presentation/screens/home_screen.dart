import 'package:flutter/material.dart';
import 'package:qeema_task/presentation/widgets/custom_app_bar.dart';
import 'package:qeema_task/presentation/widgets/header_content.dart';
import 'package:qeema_task/presentation/widgets/items_tab.dart';

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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: HeaderContent(),
            ),
            ListTile(
              title: const Text('Items'),
              onTap: () => _onDrawerItemTap(0),
            ),
            ListTile(
              title: const Text('Pricing'),
              onTap: () => _onDrawerItemTap(1),
            ),
            ListTile(
              title: const Text('Info'),
              onTap: () => _onDrawerItemTap(2),
            ),
            ListTile(
              title: const Text('Tasks'),
              onTap: () => _onDrawerItemTap(3),
            ),
            ListTile(
              title: const Text('Contact Me'),
              onTap: () => _onDrawerItemTap(4),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ItemsTab(),
                Center(
                    child: Text('Pricing Content',
                        style: TextStyle(color: Colors.white))),
                Center(
                    child: Text('Info Content',
                        style: TextStyle(color: Colors.white))),
                Center(
                    child: Text('Tasks Content',
                        style: TextStyle(color: Colors.white))),
                Center(
                    child: Text('Contact Me Content',
                        style: TextStyle(color: Colors.white))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onDrawerItemTap(int index) {
    setState(() {
      _tabController.index = index;
    });
    Navigator.pop(context);
  }
}
