import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kick/features/vendor/screen/home/home.dart';
import 'package:kick/utils/constants/logger.dart';
import 'package:kick/utils/constants/size_utils.dart';
import 'package:get/get.dart';

import 'features/authentication/screens/register.dart';
import 'features/authentication/screens/vendor/login/login.dart';
import 'features/ground/screens/look_ground.dart';
import 'features/vendor/screen/view_listing/view_listing.dart';
import 'utils/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,

        theme: AppTheme.lightTheme,
        title: 'Kick Off',
        // home: RegisterScreen(),
        // home: LookGroundScreen(),
        // home: LoginScreen(),
        home: HomeScreen(),
        // home: ViewListingScreen(),
      );
    });
  }
}
