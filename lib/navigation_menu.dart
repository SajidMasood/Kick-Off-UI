import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kick/utils/constants/bg_image.dart';

import 'features/vendor/screen/home/home.dart';
import 'features/vendor/screen/test_1/test_1.dart';
import 'features/vendor/screen/test_2/test_2.dart';
import 'utils/constants/app_colors.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Stack(
      children: [
        ///
        BgImage(),

        ///
        Scaffold(
          backgroundColor: Colors.transparent,

          /// Body
          body: Obx(() => controller.screens[controller.selectedIndex.value]),

          /// Bottom Navidation bar
          bottomNavigationBar: Obx(
            () => Container(
              color: Colors.cyan,
              padding: const EdgeInsets.only(
                  bottom: 20.0, left: 15.0, right: 15.0, top: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: NavigationBar(
                  height: 70,
                  elevation: 0,
                  selectedIndex: controller.selectedIndex.value,
                  onDestinationSelected: (index) =>
                      controller.selectedIndex.value = index,
                  backgroundColor: Colors.white,
                  indicatorColor: Colors.black.withOpacity(0.1),
                  destinations: [
                    NavigationDestination(
                        icon: Icon(Iconsax.home), label: 'Home'),
                    NavigationDestination(
                        icon: Icon(Iconsax.shop), label: 'Store'),
                    NavigationDestination(
                        icon: Icon(Iconsax.heart), label: 'Wishlist'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const TestScreen1(),
    const TestScreen2(),
    // Container(color: Colors.green),
    // Container(color: Colors.blue),
    // Container(color: Colors.deepPurple),
    // Container(color: Colors.orange),
  ];
}
