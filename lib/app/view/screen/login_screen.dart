import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_with_provider/app/controller/login_controller.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_text_styles.dart';
import '../../core/utils/image_path.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.read(loginProvider.notifier,);
    print("build");
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
                        controller: loginController.userTEController,
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
                        controller: loginController.passwordTEController,
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
                      ),

                      SizedBox(height: 16.h),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {},
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
                        child: Consumer(
                          builder: (context, ref, child) {
                            final loginState = ref.watch(loginProvider);

                            return ElevatedButton(
                              onPressed: loginState.isLoading
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        loginController.getLogin(context);
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: loginState.isLoading
                                  ? Center(child: CircularProgressIndicator())
                                  : Text('Log In'),
                            );
                          },
                        ),
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
                        onTap: () async {},
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
                          onTap: () {},
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
