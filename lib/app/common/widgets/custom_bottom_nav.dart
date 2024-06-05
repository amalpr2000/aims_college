import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends StatelessWidget {
  final List<BottomNavBarItem> navBarItems;

  const CustomBottomNavBar({
    super.key,
    required this.navBarItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6, left: 6, top: 6, bottom: 10),
      height: Get.width * .175,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [...navBarItems],
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  final int index;
  final int currentPage;
  final Function() onTap;
  final IconData iconData;
  final String label;
  final BottomNavBadge? badge;

  const BottomNavBarItem({
    super.key,
    required this.index,
    required this.currentPage,
    required this.onTap,
    required this.iconData,
    required this.label,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = (index == currentPage);

    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 1500),
            curve: Curves.fastLinearToSlowEaseIn,
            margin: EdgeInsets.only(
              bottom: isSelected ? Get.width * .002 : Get.width * .029,
              right: Get.width * .0422,
              left: Get.width * .0422,
            ),
            width: Get.width * .128,
            height: isSelected ? Get.width * .014 : 0,
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
          ),
          badge ??
              FaIcon(
                iconData,
                size: Get.width * .056,
                color: isSelected ? Colors.blue.shade900 : Colors.black38,
              ),
          Text(
            label,
            style: TextStyle(
                color: isSelected ? Colors.blue.shade900 : Colors.black38,
                fontWeight: FontWeight.bold,
                fontSize: 10),
          ),
          SizedBox(height: Get.width * .001)
        ],
      ),
    );
  }
}

class BottomNavBadge extends StatelessWidget {
  final int index;
  final int currentPage;
  final String badgeLabel;
  final IconData iconData;
  const BottomNavBadge({
    super.key,
    required this.badgeLabel,
    required this.iconData,
    required this.index,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = (index == currentPage);

    return Badge(
      label: Text(badgeLabel),
      child: FaIcon(
        iconData,
        size: Get.width * .056,
        color: isSelected ? Colors.blue.shade900 : Colors.black38,
      ),
    );
  }
}
