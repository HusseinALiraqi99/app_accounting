import 'package:app_accounting/controller/auth/Customerrecord_controller.dart';
import 'package:app_accounting/view/screen/auth/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  Get.put(CustomerRecordController());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, home: SigninScreen()
        //home: HomepageScreen(),
        );
  }
}
