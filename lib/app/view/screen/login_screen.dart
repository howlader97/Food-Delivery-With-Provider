import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_text_styles.dart';
import '../../core/utils/image_path.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor, //backgroundColor
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: _formKey,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 50.h)),
                SliverToBoxAdapter(
                  child: Text(
                    'Log In \nYour Account',
                    style: AppTextStyles.medium32,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 28.h),
                      Text('Email', style: AppTextStyles.medium16),
                      SizedBox(height: 8.h),
                      TextFormField(

                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                        ),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter your email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      Text('password', style: AppTextStyles.medium16),
                      SizedBox(height: 8.h),
                       TextFormField(

                          decoration: InputDecoration(
                            hintText: 'Enter your Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                     Icons.visibility_off,

                                color: AppColors.primaryColor,
                              ), onPressed: () {  },

                            ),
                          ),
                          validator: (String? value) {
                            //check validity
                            if (value?.isEmpty ?? true) {
                              return 'Enter your password';
                            }
                            if (value!.length != 6) {
                              return 'Enter six digit or letter';
                            }
                            return null;
                          },
                        ),


                      SizedBox(height: 16.h),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {

                          },
                          child: Text(
                            'Forget Password',
                            style: AppTextStyles.medium16.copyWith(
                              color: Color(0xffFF5900),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 40.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                              onPressed: () {

                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text('Log In'),
                            )
                        ),

                      SizedBox(height: 35.h),
                      Text(
                        'Or Log In with',
                        style: AppTextStyles.medium14.copyWith(
                          color: AppColors.darkBlackColor,
                        ),
                      ),
                      SizedBox(height: 35.h),
                      GestureDetector(
                            onTap: () async {

                            },
                            child: Image.asset(ImagePath.googleIcon, scale: 4),
                          ),
                      SizedBox(height: 25.h),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Center(
                    child: Row(
                      children: [
                        Spacer(),
                        Text(
                          "Don't have an account? ",
                          style: AppTextStyles.medium13,
                        ),
                        InkWell(
                          onTap: () {
                          },
                          child: Text(
                            "Sign Up",
                            style: AppTextStyles.medium14.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
