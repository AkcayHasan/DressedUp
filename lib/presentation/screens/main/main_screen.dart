import 'package:dressed_up/core/components/custom_bottom_nav_bar.dart';
import 'package:dressed_up/presentation/screens/favourite/favourite_screen.dart';
import 'package:dressed_up/presentation/screens/home/home_screen.dart';
import 'package:dressed_up/presentation/screens/profile/profile_screen.dart';
import 'package:dressed_up/presentation/screens/search/search_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    SearchScreen(),
    FavouriteScreen(),
    ProfileScreen()
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _selectedIndex, onTabSelected: _onTabSelected),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.purple,
        elevation: 0,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
