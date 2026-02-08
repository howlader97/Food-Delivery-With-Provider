import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_with_provider/app/core/api_handler/login_api_service.dart';
import 'package:food_delivery_with_provider/app/core/shared_preference/shared_preference.dart';

import '../core/app_route/app_route.dart';
import 'login_state.dart';

final loginProvider = StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController();
});

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(LoginState());
  final TextEditingController userTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();

  Future<void> getLogin(BuildContext context) async {
    print("remon----------------");
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final response = await LoginApiService.loginApiRequest(
        "https://khalifa.mtscorporate.com/user/login",
        <String, dynamic>{
          "username": userTEController.text.trim(),
          "password": passwordTEController.text,
        },
      );
      print("response-------${response.body}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token=data["access_token"];
        print("token is $token ");
        SharedPrefService.saveUserToken(token);
        state = state.copyWith(isLoading: false, isSuccess: true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login Successful"),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteName.home,
          (route) => false,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: "Invalid username & password",
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.errorMessage ?? "Login Failed"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: "Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMessage ?? "Login Failed"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
  void disPose(){
    userTEController.dispose();
    passwordTEController.dispose();
    super.dispose();
  }
}
