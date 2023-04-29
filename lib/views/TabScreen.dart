import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:micmusic/constants.dart';
import 'package:micmusic/views/Accounts.dart';
import 'package:micmusic/views/homePageView.dart';

class TabScreenView extends StatefulWidget {
  const TabScreenView({super.key});

  @override
  State<TabScreenView> createState() => _TabScreenViewState();
}

class _TabScreenViewState extends State<TabScreenView> {
  @override
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget build(BuildContext context) {
    Widget activePage = HomePageView();
    
    if (_selectedPageIndex == 3) {
      activePage = Account();
    }
    return Scaffold(
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: brand2,
        selectedItemColor: brand1,
        unselectedItemColor: neutral2,
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radio_outlined),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
