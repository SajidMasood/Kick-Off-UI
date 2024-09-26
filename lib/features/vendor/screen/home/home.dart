import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kick/common/app_bar/app_bar.dart';
import 'package:kick/common/custom_image_view.dart';
import 'package:kick/features/vendor/screen/add_venue/add_venue.dart';
import 'package:kick/utils/constants/app_images.dart';
import 'package:kick/utils/constants/size_utils.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/bg_image.dart';
import '../../controller/home_controller/home_controller.dart';
import '../view_booking/view_booking.dart';
import 'widgets/bottom_nav.dart';
import 'widgets/custom_button.dart';
import 'widgets/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Stack(
      children: [
        /// Background Image
        BgImage(),

        /// Scaffold with semi-transparent background
        Scaffold(
          backgroundColor: AppColors.primary.withOpacity(0.5),

          /// appbar
          appBar: CustomAppBar(
            paddingTop: 20,
            bgColor: Colors.transparent,
            leadingIcon: AppImages.drawarIcon,
            centerTitle: true,
            title: CustomImageView(
              height: 50,
              width: 50,
              imagePath: AppImages.imgKickOffAcademy,
            ),
          ),

          ////
          body: Padding(
            padding: EdgeInsets.all(24.h),
            child: Column(
              children: [
                /// Header Section
                const HomeHeader(),
                SizedBox(height: 120.h),

                /// Main Buttons
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        text: 'Venue Listings',
                        onTap: () {
                          log('Tapped on Button');
                          Get.to(
                            () => AddVenueScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: 'View Bookings',
                        onTap: () {
                          log('Tapped on Button');
                          Get.to(
                            () => ViewBookingScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// Bottom Navigation Bar
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: CustomBottomNavBar(),
          ),
        ),
      ],
    );
  }
}
