import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/image_path.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Image.asset(ImagePath.splashBackground, fit: BoxFit.cover),
            Center(child: Image.asset(ImagePath.splashIcon,height: 200.h,width: 200.w,)),
          ],
        ),
      ),
    );
  }
}
