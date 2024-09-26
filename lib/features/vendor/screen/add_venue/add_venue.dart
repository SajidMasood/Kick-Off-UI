import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kick/utils/constants/bg_image.dart';
import 'package:kick/utils/constants/size_utils.dart';

import '../../../../common/app_bar/app_bar.dart';
import '../../../../common/custom_image_view.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_images.dart';
import '../home/widgets/bottom_nav.dart';
import 'widgets/add_venue_form.dart';

class AddVenueScreen extends StatelessWidget {
  const AddVenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// bg image
        BgImage(),

        /// main content
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
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  SizedBox(height: 30.h),

                  /// 1. Logo, Title & SubTitle
                  Text(
                    'Add Venue',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: Colors.white,
                          fontSize: 20.h,
                        ),
                  ),
                  SizedBox(height: 30.h),

                  /// 2. Form...
                  const AddVenueForm(),

                  ///
                ],
              ),
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
