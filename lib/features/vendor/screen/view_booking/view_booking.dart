import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kick/utils/constants/bg_image.dart';
import 'package:kick/utils/constants/size_utils.dart';

import '../../../../common/app_bar/app_bar.dart';
import '../../../../common/custom_image_view.dart';
import '../../../../common/filter_btn_img/filter_btn_img.dart';
import '../../../../common/text_form_field/text_form_field.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_images.dart';
import '../../controller/view_booking_controller/view_booking_controller.dart';
import '../../model/booking_list/boking_list_model.dart';
import '../booking_details/booking_details.dart';
import '../view_listing/widget/booking_list_item.dart';

class ViewBookingScreen extends StatelessWidget {
  const ViewBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ViewBookingController());
    return Stack(
      children: [
        /// bg image
        BgImage(),

        ///
        Scaffold(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),

          /// appbar
          appBar: CustomAppBar(
            bgColor: Colors.transparent,
            leadingIcon: AppImages.drawarIcon,
            centerTitle: true,
            title: Text(
              'View Listings',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white, fontSize: 20.h),
            ),
          ),

          /// main content
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSearchSection(),
                SizedBox(height: 14.h),
                _buildFilterSection(),
                SizedBox(height: 30.h),
                _buildBookingList(controller),
              ],
            ),
          ),

          ///
        ),
      ],
    );
  }

  _buildBookingList(ViewBookingController controller) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.bookingItems.length,
        separatorBuilder: (_, __) => SizedBox(height: 12.h),
        itemBuilder: (_, index) {
          return ViewBookingListItemWidget(
            bookingItem: controller.bookingItems[index],
          );
        },
      ),
    );
  }

  _buildFilterSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomFilterButtonWithImage(
          title: 'Filter',
          imagePath: AppImages.filter_1,
        ),

        /// 2.
        CustomFilterButtonWithImage(
          title: 'Filter',
          imagePath: AppImages.icon8_4,
        ),

        /// 3. downArrow
        CustomFilterButtonWithImage(
          title: 'Filter',
          imagePath: AppImages.downArrow,
        ),

        /// 4. downArrow
        CustomFilterButtonWithImage(
          title: 'Filter',
          imagePath: AppImages.downArrow,
        ),

        /// 5. downArrow
        CustomFilterButtonWithImage(
          title: 'Filter',
          imagePath: AppImages.downArrow,
        ),
      ],
    );
  }

  _buildSearchSection() {
    return Container(
      width: double.infinity,
      // margin: EdgeInsets.only(right: 6.h),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              textStyle: Theme.of(Get.context!)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
              borderDecoration: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.h),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              ),
              prefix: Icon(Icons.search, color: Colors.white),
              hintText: 'Type here to search something',
              hintStyle: Theme.of(Get.context!)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
          ),
          SizedBox(width: 8.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.gray100,
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onPressed: () {},
            child: Text('Search'),
          ),
        ],
      ),
    );
  }
}

class ViewBookingListItemWidget extends StatelessWidget {
  const ViewBookingListItemWidget({super.key, required this.bookingItem});

  final BookingListItemModel bookingItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.h),
      ),
      child: Column(
        children: [
          /// 1.  Booking ID Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: AppImages.apple,
                      height: 24.h,
                      width: 24.h,
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Booking ID',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 14.fSize,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter',
                                  ),
                        ),
                        Text(
                          bookingItem.bookingIdNumber,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.primary,
                                    fontSize: 12.fSize,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter',
                                  ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              /// Manage Calendar Button
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                  width: 24,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.edit),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),

          /// 2.  Venue Row
          Row(
            children: [
              CustomImageView(
                imagePath: AppImages.apple,
                height: 24.h,
                width: 24.h,
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Venue Name',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14.fSize,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  Text(
                    bookingItem.venueTitle,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.primary,
                          fontSize: 12.fSize,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),

          /// Date Row
          Row(
            children: [
              CustomImageView(
                imagePath: AppImages.apple,
                height: 24.h,
                width: 24.h,
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14.fSize,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  Text(
                    bookingItem.date,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.primary,
                          fontSize: 12.fSize,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),

          /// Status Row
          Row(
            children: [
              CustomImageView(
                imagePath: AppImages.apple,
                height: 24.h,
                width: 24.h,
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14.fSize,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  Text(
                    bookingItem.StatusTitle,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.primary,
                          fontSize: 12.fSize,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),

          /// Created At Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: AppImages.apple,
                      height: 24.h,
                      width: 24.h,
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Created At',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 14.fSize,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                        Text(
                          bookingItem.createAt,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.primary,
                                    fontSize: 12.fSize,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// Manage Calendar Button
              Row(
                children: [
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        log('more Button');
                        Get.to(() => BookingDetailsScreen(),
                            transition: Transition.rightToLeft);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.h),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      child: Text(
                        'more..',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                              fontSize: 12.fSize,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Hind',
                            ),
                      ),
                    ),
                  ),

                  /// image no. 1
                  CustomImageView(
                    onTap: () {
                      log('refresh icon');
                    },
                    imagePath: AppImages.refresh_1,
                    height: 28,
                  ),

                  /// image no. 2
                  CustomImageView(
                    onTap: () {
                      log('eye icon');
                    },
                    imagePath: AppImages.eyes,
                    height: 28,
                  ),

                  /// image no. 3
                  CustomImageView(
                    onTap: () {
                      log('time icon');
                    },
                    imagePath: AppImages.time,
                    height: 28,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
