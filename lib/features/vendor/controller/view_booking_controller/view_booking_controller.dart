import 'package:get/get.dart';

import '../../model/booking_list/boking_list_model.dart';

class ViewBookingController extends GetxController {
  static ViewBookingController get instance => Get.find();

  /// vars
  /// vars
  final List<BookingListItemModel> bookingItems = <BookingListItemModel>[
    BookingListItemModel(
      bookingIdNumber: 'BN-8688854',
      venueTitle: 'Not Available',
      date: 'Not Available',
      StatusTitle: 'Not Available',
      createAt: 'Not Available',
    ),
    BookingListItemModel(
      bookingIdNumber: 'BN-8699954',
      venueTitle: 'Not Available',
      date: 'Not Available',
      StatusTitle: 'Not Available',
      createAt: 'Not Available',
    ),
    BookingListItemModel(
      bookingIdNumber: 'BN-8688854',
      venueTitle: 'Not Available',
      date: 'Not Available',
      StatusTitle: 'Not Available',
      createAt: 'Not Available',
    ),
    BookingListItemModel(
      bookingIdNumber: 'BN-8699954',
      venueTitle: 'Not Available',
      date: 'Not Available',
      StatusTitle: 'Not Available',
      createAt: 'Not Available',
    ),
    // Add more items
  ];
  /// oninit
}
