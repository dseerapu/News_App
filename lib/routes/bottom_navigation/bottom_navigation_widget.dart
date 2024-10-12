import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      backgroundColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(FluentIcons.home_12_regular),
          label: "Home",
          activeIcon: Icon(FluentIcons.home_12_filled),
        ),
        BottomNavigationBarItem(
          icon: Icon(FluentIcons.communication_16_regular),
          label: "Explore",
        ),
        BottomNavigationBarItem(
          icon: Icon(FluentIcons.bookmark_16_regular),
          label: "Saved",
        ),
        BottomNavigationBarItem(
          icon: Icon(FluentIcons.person_12_regular),
          label: "Profile",
        ),
      ],
    );
  }
}