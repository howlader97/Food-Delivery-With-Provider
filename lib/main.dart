import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/core/app_route/app_route.dart';
import 'app/view/screen/splash_view.dart';

void main() {
  runApp(const ProviderScope(child: FoodApp()));
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // standard mobile
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
         initialRoute: AppRoute.initialRoute
        );
      },
    );
  }
}
