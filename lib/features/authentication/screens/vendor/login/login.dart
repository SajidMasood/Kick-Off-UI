import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kick/utils/constants/app_colors.dart';
import 'package:kick/utils/constants/size_utils.dart';

import '../../../../../common/divider/divider.dart';
import '../../../../../common/social_media/social_media.dart';
import '../../../../../utils/constants/app_images.dart';
import '../../../../../utils/constants/bg_image.dart';
import '../../../controllers/vendor/login_controller/login_controller.dart';
import '../signup/signup.dart';
import 'widgets/login_form.dart';
import '../../../../../common/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<LoginController>(LoginController());
    return Stack(
      children: [
        /// bg image
        BgImage(),

        ///
        Scaffold(
          backgroundColor: AppColors.primary.withOpacity(0.5),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 1. Logo, Title & SubTitle
                  const SizedBox(height: 54),
                  const LoginHeader(title: 'Log in'),
                  const SizedBox(height: 40),

                  /// 2. Form...
                  const LoginForm(),
                  const SizedBox(height: 30),

                  ///3.  Divider
                  MyFormDivider(
                    dividerText: 'or Log in with'.capitalize!,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),

                  /// 4. Social Login Buttons
                  SocialButton(),
                  const SizedBox(height: 80),

                   
                  /// 7. Sign Up Link
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 15.h,
                              color: AppColors.gray100,
                            ),
                        children: [
                          TextSpan(
                            text: "Sign up",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  fontSize: 16.h,
                                  color: Colors.white,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                log('Sign up text tapped!');
                                Get.to(() => SignupScreen(),
                                    transition: Transition.rightToLeft);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
