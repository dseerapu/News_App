import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/routes/news_app_routes.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0: // Home
        context.go(NewsAppRoutes.news.path); // Navigate to the Home (NewsScreen)
        break;
      case 1: // Saved
        context.go(NewsAppRoutes.savedNews.path); // Navigate to the SavedNewsScreen
        break;
      case 2: // Profile
        context.go(NewsAppRoutes.profile.path);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      backgroundColor: Colors.black,
      currentIndex: _selectedIndex, // Track selected index
      onTap: _onItemTapped,

      items: [
        BottomNavigationBarItem(
          icon: Icon(
            _selectedIndex == 0 ? FluentIcons.home_12_filled : FluentIcons.home_12_regular, // Swap icons
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            _selectedIndex == 1 ? FluentIcons.bookmark_16_filled : FluentIcons.bookmark_16_regular, // Swap icons
          ),
          label: "Saved",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            _selectedIndex == 2 ? FluentIcons.person_12_filled : FluentIcons.person_12_regular, // Swap icons
          ),
          label: "Profile",
        ),
      ],
    );
  }
}