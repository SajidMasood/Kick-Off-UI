import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kick/features/authentication/controllers/register_controller.dart';
import 'package:kick/utils/constants/size_utils.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/validators/validator.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
      // resizeToAvoidBottomInset: false,

      /// appbar
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text('Register Screen'),
      ),

      /// body
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.green,
          width: double.maxFinite,
          padding: EdgeInsets.only(
            top: 94.h,
            left: 38.h,
            right: 38.h,
          ),
          child: Column(
            children: [
              /// Registration text
              Text(
                'Registration',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(height: 8.h),
              Text(
                "Please enter your Details",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 24.h),

              /// full name
              TextFormField(
                controller: controller.fullname,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 18.h,
                      vertical: 10.h,
                    ),
                    hintText: "Full Name",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 15.h, fontWeight: FontWeight.bold)),
                validator: (value) {
                  if (!MyValidator.isText(value)) {
                    return 'please enter valid text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 22.h),

              /// phone number
              TextFormField(
                controller: controller.phoneNumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Phone No',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 15.h, fontWeight: FontWeight.bold),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 18.h,
                    vertical: 10.h,
                  ),
                ),
                validator: (value) {
                  if (!MyValidator.isValidPhone(value)) {
                    return 'please enter valid phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 22.h),

              /// Email address
              TextFormField(
                  controller: controller.emailAddress,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Email Address",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 15.h, fontWeight: FontWeight.bold),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 18.h,
                      vertical: 10.h,
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        (!MyValidator.isValidEmail(value, isRequired: true))) {
                      return "Please enter valid email";
                    }
                    return null;
                  }),
              SizedBox(height: 42.h),

              ///Submit Button
              SizedBox(
                height: 50.h,
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              ///
              RichText(
                text: TextSpan(
                  // style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                      text: 'Not a member yet? ',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.onPrimaryContainer,
                            fontSize: 14.fSize,
                          ),

                      ///
                      // theme.textTheme.titleSmall!.copyWith(
                      //     color: theme.colorScheme.onPrimaryContainer,
                      //     fontSize: 14.fSize,
                      //   )
                      ///
                    ),
                    TextSpan(
                      text: 'Login',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.primary,
                            fontStyle: FontStyle.italic,
                            fontSize: 14.fSize,
                          ),
                    ),
                  ],
                ),
              ),
              

              ///
            ],
          ),
        ),
      ),

      ///
    );
  }
}
