import 'package:aims_college/app/common/widgets/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: PageView(
        onPageChanged: (value) {
          controller.page.value = value;
        },
        controller: controller.pageCtr,
        children: const [
          Center(
            child: Text(
              'Home ',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              'Courses',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => CustomBottomNavBar(navBarItems: [
          BottomNavBarItem(
              index: 0,
              currentPage: controller.page.value,
              onTap: () {
                controller.page.value = 0;
                controller.pageCtr.jumpToPage(controller.page.value);
              },
              iconData: FontAwesomeIcons.house,
              label: 'Home'),
          BottomNavBarItem(
              index: 1,
              currentPage: controller.page.value,
              onTap: () {
                controller.page.value = 1;
                controller.pageCtr.jumpToPage(controller.page.value);
              },
              iconData: FontAwesomeIcons.graduationCap,
              label: 'Courses'),
        ]),
      ),
    );
  }
}
