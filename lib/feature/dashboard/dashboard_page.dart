import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../calls/call_page.dart';
import '../chat/chat_page.dart';
import '../contact/contact_page.dart';
import '../settings/settings_page.dart';
import '_components/bottom_navigation.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with TickerProviderStateMixin {
  
  late TabController tabController;

  int selectedIndex = 0;

  List<Widget> contents = const [
    ChatPage(),
    CallPage(),
    ContactPage(),
    SettingsPage()
  ];

  @override
   void initState() {
    tabController = TabController(length: 4, vsync: this)..addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {
      selectedIndex = tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: contents.toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        tabController: tabController,
        selectedIndex: selectedIndex,
        onTabChanged: (index) {
          print(selectedIndex);
        }
      ),
    );
  }
}