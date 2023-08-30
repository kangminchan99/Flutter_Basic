import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(
      () => setState(() => _selectedIndex = _tabController.index),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNav'),
      ),
      body: _selectedIndex == 0
          ? tabContainer(context, Colors.indigo, 'friends')
          : _selectedIndex == 1
              ? tabContainer(context, Colors.amber, 'chat')
              : tabContainer(context, Colors.black, 'setting'),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        labelColor: Colors.black,
        tabs: [
          Tab(
            icon: Icon(
              _selectedIndex == 0 ? Icons.person : Icons.person_2_outlined,
            ),
            text: 'friends',
          ),
          Tab(
            icon: Icon(
              _selectedIndex == 1 ? Icons.chat : Icons.chat_outlined,
            ),
            text: 'chat',
          ),
          Tab(
            icon: Icon(
              _selectedIndex == 2 ? Icons.settings : Icons.settings_outlined,
            ),
            text: 'setting',
          ),
        ],
      ),
    );
  }

  Widget tabContainer(BuildContext context, Color tabColor, String tabText) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: tabColor,
      child: Center(
        child: Text(tabText),
      ),
    );
  }
}
