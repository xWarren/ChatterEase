import 'package:flutter/material.dart';

import '../../../core/custom/custom_circle_tab_indicator.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/colors.dart';

class BottomNavigation extends StatelessWidget {
  final TabController tabController;
  final int selectedIndex;
  final Function(int) onTabChanged;
  const BottomNavigation({
    required this.tabController,
    required this.selectedIndex,
    required this.onTabChanged,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 65,
      margin: const EdgeInsets.only(left: 14, bottom: 24, right: 14),
      padding: const EdgeInsets.only(top: 5),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: CustomColors.fade)
        )
      ),
      child: TabBar(
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: CircleTabIndicator(color: CustomColors.buttonColor, radius: 4),
        indicatorPadding: const EdgeInsets.only(top: 20),
        onTap: onTabChanged,
        tabs: [
          Tab(
            icon: Image.asset(Assets.icChat, color: selectedIndex == 0 ? CustomColors.buttonColor : null)
          ),
          Tab(
            icon: Image.asset(Assets.icCalls, color: selectedIndex == 1 ? CustomColors.buttonColor : null)
          ),
          Tab(
            icon: Image.asset(Assets.icContacts, color: selectedIndex == 2 ? CustomColors.buttonColor : null)
          ),
          Tab(
            icon: Image.asset(Assets.icSettings, color: selectedIndex == 3 ? CustomColors.buttonColor : null)
          )
        ],
      ),
    );
  }
}