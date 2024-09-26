import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kick/common/app_bar/app_bar.dart';
import 'package:kick/common/custom_image_view.dart';
import 'package:kick/common/text_form_field/text_form_field.dart';
import 'package:kick/features/vendor/controller/view_listing_controller/view_listing_controller.dart';
import 'package:kick/utils/constants/app_images.dart';
import 'package:kick/utils/constants/bg_image.dart';
import 'package:kick/utils/constants/size_utils.dart';

import '../../../../common/filter_btn_img/filter_btn_img.dart';
import '../../../../utils/constants/app_colors.dart';
import 'widget/booking_list_item.dart';

class ViewListingScreen extends StatelessWidget {
  const ViewListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ViewListingController());
    return Stack(
      children: [
        /// bg image
        BgImage(),

        ///  Mian Content
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

  _buildBookingList(ViewListingController controller) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.bookingItems.length,
        separatorBuilder: (_, __) => SizedBox(height: 12.h),
        itemBuilder: (_, index) {
          return BookingListItemWidget(
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
