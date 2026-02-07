import 'package:flutter/material.dart';
import 'package:food_delivery_with_provider/app/core/utils/app_text_styles.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text("Splash",style: AppTextStyles.bold22,),),
          ElevatedButton(onPressed: (){

          }, child: Text('Go to login'),)
        ],
      ),
    );
  }
}
