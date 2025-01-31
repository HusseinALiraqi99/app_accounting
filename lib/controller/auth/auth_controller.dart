import 'package:app_accounting/view/screen/home/homecustmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  void login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and password cannot be empty",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    //النتظار تحميل الصفحة
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    // Simulate a login process
    await Future.delayed(Duration(seconds: 2));
    Get.back(); // Close the dialog
    Get.snackbar("Success", "Logged in successfully!",
        snackPosition: SnackPosition.BOTTOM);
    _saveLoginState(true);
    Get.to(HomepageScreen());
  }

  void register(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and password cannot be empty",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // Simulate a registration process
    await Future.delayed(Duration(seconds: 2));
    Get.snackbar("Success", "Account created successfully!",
        snackPosition: SnackPosition.BOTTOM);
    _saveLoginState(true);
    Get.to(HomepageScreen());
  }

  Future<void> _saveLoginState(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  void logout() async {
    _saveLoginState(false);
    Get.snackbar("Success", "Logged out successfully!",
        snackPosition: SnackPosition.BOTTOM);
    // Navigate to login screen or any other appropriate screen
  }
}
