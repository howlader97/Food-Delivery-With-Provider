import 'package:flutter/material.dart';
import 'package:food_delivery_with_provider/app/view/screen/home_view.dart';
import 'package:food_delivery_with_provider/app/view/screen/login_screen.dart';
import '../../view/screen/sign_up_screen.dart';
import '../../view/screen/signup_otp_screen.dart';
import '../../view/screen/splash_Screen.dart';


class RouteName {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String otp = '/otp';
  static const String home = '/home';
}

class AppRoute {
  static Map<String,WidgetBuilder> routes={
    RouteName.splash:(context) => const SplashScreen(),
    RouteName.login:(context) => LoginScreen(),
    RouteName.signup:(context) => SignUpScreen(),
    RouteName.otp:(context) => SignupOtpScreen(),
    RouteName.home:(context) => HomeView(),
  };
}

