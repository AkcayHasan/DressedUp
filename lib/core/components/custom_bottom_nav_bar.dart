import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const CustomBottomNavBar(
      {super.key, required this.currentIndex, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    double spacingWidth = MediaQuery.of(context).size.width * 0.1;

    return BottomAppBar(
      height: 65,
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(child: _buildNavItem(Icons.home, "Home", 0)),
          Flexible(child: _buildNavItem(Icons.home, "Search", 1)),
          SizedBox(width: spacingWidth),
          Flexible(child: _buildNavItem(Icons.home, "Favourite", 2)),
          Flexible(child: _buildNavItem(Icons.home, "Profile", 3)),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.purple : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.purple : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
