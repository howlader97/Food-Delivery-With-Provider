import 'package:flutter/material.dart';
import '../../core/app_route/app_route.dart';
import '../../core/utils/app_text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 300,),
          Center(child: Text("Splash", style: AppTextStyles.bold22)),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, RouteName.login,(route) => false);
            },
            child: Text('Go to signup'),
          ),
        ],
      ),
    );
  }
}
