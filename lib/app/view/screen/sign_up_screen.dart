import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_route/app_route.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_text_styles.dart';
import '../../core/utils/image_path.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0.w,
                    vertical: 24.0.h,
                  ),
                  child: Text('Sign Up', style: AppTextStyles.medium32),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Row(
                    children: [
                      // First field
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('First Name', style: AppTextStyles.medium16),
                            SizedBox(height: 8.h),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Enter First Name',
                              ),
                              validator: (String? value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Enter firs name';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Last Name', style: AppTextStyles.medium16),
                            SizedBox(height: 8.h),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Enter Last Name',
                              ),
                              validator: (String? value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Enter last name';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      Text('Email', style: AppTextStyles.medium16),
                      SizedBox(height: 8.h),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
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
                      Text('Number', style: AppTextStyles.medium16),
                      SizedBox(height: 8.h),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Enter your number',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your number';
                          } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'Number must contain digits only';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('District', style: AppTextStyles.medium16),
                            SizedBox(height: 8.h),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Enter District Name',
                              ),
                              validator: (String? value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Enter District name';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('City', style: AppTextStyles.medium16),
                            SizedBox(height: 8.h),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Enter City Name',
                              ),
                              validator: (String? value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Enter city name';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      Text('Address', style: AppTextStyles.medium16),
                      SizedBox(height: 8.h),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Example:house no 32',
                        ),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter your Address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      Text('Create Password', style: AppTextStyles.medium16),
                      SizedBox(height: 8.h),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter six digit or letter Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.visibility_off,
                              color: AppColors.primaryColor,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter your password';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 16.h),
                      Text('Confirm Password', style: AppTextStyles.medium16),
                      SizedBox(height: 8.h),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.visibility_off,

                              color: AppColors.primaryColor,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter your password';
                          }
                          if (value!.length != 6) {
                            return 'Enter six letter or digit';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text('Sign Up'),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        'Or Sign UP with',
                        style: AppTextStyles.medium14.copyWith(
                          color: AppColors.darkBlackColor,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Image.asset(ImagePath.googleIcon, scale: 4),
                      SizedBox(height: 25.h),
                    ],
                  ),
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
                          Navigator.pushNamed(context, RouteName.home);
                        },

                        child: Text(
                          "Sign In",
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
    );
  }
}
