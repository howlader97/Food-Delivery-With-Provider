import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_text_styles.dart';


class SignupOtpView extends StatelessWidget {
  SignupOtpView({super.key});

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          onPressed: () {

          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Form(
        key: _globalKey,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(
                  children: [
                    SizedBox(height: 160.h),
                    Text("Otp Verification", style: AppTextStyles.medium32),
                    SizedBox(height: 12.h),
                    Center(
                      child: Text(
                        'We sent Verification code to your Email address',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 25.h),
                    PinCodeTextField(
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter valid otp';
                        }
                        return null;
                      },
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      keyboardType: TextInputType.number,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 50,
                        activeFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                        activeColor: AppColors.primaryColor,
                        inactiveColor: AppColors.primaryColor,
                        selectedColor: Colors.green,
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      onCompleted: (v) {},
                      onChanged: (value) {},
                      beforeTextPaste: (text) {
                        return true;
                      },
                      appContext: context,
                    ),
                    SizedBox(height: 25.h),
                    SizedBox(
                      width: double.infinity,
                      child:  ElevatedButton(
                            onPressed: () {
                              if (_globalKey.currentState!.validate()) {

                              }
                            },
                            child: Text("Next"),
                          )
                    ),
                    SizedBox(height: 25.h),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child:  Row(
                      children: [
                        Spacer(),
                        Text(
                          "Didn't receive a code!",
                          style: AppTextStyles.medium13,
                        ),
                        InkWell(
                          child: Text(
                            "  Resend",
                            style: AppTextStyles.medium14.copyWith(
                              color:  AppColors.primaryColor,
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 25.h)),
          ],
        ),
      ),
    );
  }
}
