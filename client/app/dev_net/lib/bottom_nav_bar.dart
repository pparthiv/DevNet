import 'package:dev_net/features/core/screens/community/community.dart';
import 'package:dev_net/features/core/screens/home/home.dart';
import 'package:dev_net/features/personalization/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navBarController = Get.put(NavigationController());
    final pageController = PageController();

    return PopScope(
      onPopInvoked: (didPop) {
        NavigationController.instance.dispose();

        debugPrint("Will Pop Called");
      },
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
              NavigationDestination(
                  icon: Icon(Icons.people_alt_outlined), label: "Community"),
              NavigationDestination(
                  icon: Icon(Iconsax.setting), label: "Settings"),
            ],
            elevation: 0,
            height: 80,
            selectedIndex: navBarController.selectedIndex.value,
            onDestinationSelected: (value) {
              // Set the selected index directly without animation
              navBarController.selectedIndex.value = value;

              // Jump directly to the selected page
              pageController.jumpToPage(value);
            },
          ),
        ),
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [Home(), Community(), Settings()],
          onPageChanged: (index) {
            navBarController.selectedIndex.value = index;
          },
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();

  Rx<int> selectedIndex = 0.obs;

  @override
  void onClose() {
    debugPrint('NavigationController closed');

    super.onClose();
  }
}
