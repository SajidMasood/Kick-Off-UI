import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kick/features/ground/controller/pitches_controller.dart';
import 'package:kick/utils/constants/size_utils.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';

import '../../../utils/constants/app_colors.dart';

class PitchesScreen extends StatelessWidget {
  const PitchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<PitchesController>(PitchesController());
    return Scaffold(
      // backgroundColor: AppColors.gray100,

      /// appbar
      appBar: AppBar(
        title: Text('View Screen'),
        centerTitle: true,
      ),

      /// body
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16.h),
              _buildAcademyInfo(context),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),

      ///
    );
  }

  _buildAcademyInfo(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "KARACHI HEIGHTS ACADEMY",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
          ),
          SizedBox(height: 4.h),
          Text(
            "4G Astro Turf pitch 5, 7 and 11 aside markings with respective markings",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(height: 28.h),

          /// sliders
          // SizedBox(
          //   width: double.maxFinite,
          //   child: Obx(
          //     () => CarouselSlider.builder(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
