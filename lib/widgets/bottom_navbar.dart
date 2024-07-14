import 'package:flutter/material.dart';
import 'package:sav_project/theme/colors.dart';

class BottomNavbar extends StatefulWidget {
  final Function(int) onTap;
  final int currentIndex;

  const BottomNavbar(
      {required this.onTap, required this.currentIndex, super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 12),
          margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.13),
                spreadRadius: 0,
                blurRadius: 18,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: 'assets/icons/homeOutlined.png',
                index: 0,
                size: 33,
              ),
              _buildNavItem(
                icon: 'assets/icons/carOutlined.png',
                index: 1,
                size: 40,
                topPadding: 5,
              ),
              _buildNavItem(
                icon: 'assets/icons/addFull.png',
                index: 2,
                size: 52,
                color: AppColors.kPrimaryColor,
              ),
              _buildNavItem(
                icon: 'assets/icons/calendarNavOulined.png',
                index: 3,
                size: 37,
                topPadding: 5,
              ),
              _buildNavItem(
                icon: 'assets/icons/people.png',
                index: 4,
                size: 33,
              ),
            ],
          ),
        ),
        Positioned(
          left: _calculateUnderlinePosition(widget.currentIndex, context),
          bottom: 10.5,
          child: Container(
            height: 2,
            width: 39,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  double _calculateUnderlinePosition(int index, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double marginHorizontal = 18;
    double paddingHorizontal = 12;
    double navBarWidth =
        screenWidth - 2 * marginHorizontal - 2 * paddingHorizontal;
    int numberOfItems = 5;
    double itemWidth = navBarWidth / numberOfItems;
    double offset = (itemWidth - 39) / 2;
    return marginHorizontal + paddingHorizontal + itemWidth * index + offset;
  }

  Widget _buildNavItem({
    required String icon,
    required int index,
    Color color = Colors.black,
    double size = 40,
    double topPadding = 0,
  }) {
    bool isSelected = widget.currentIndex == index;
    return IconButton(
      highlightColor: Colors.transparent,
      padding: EdgeInsets.only(top: topPadding),
      icon: ImageIcon(
        AssetImage(icon),
        color: color,
        size: isSelected ? size + 3 : size,
      ),
      onPressed: () {
        widget.onTap(index);
      },
    );
  }
}
