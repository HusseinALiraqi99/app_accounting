import 'package:app_accounting/controller/auth/auth_controller.dart';
import 'package:app_accounting/core/colorstyle.dart';
import 'package:app_accounting/core/fontstyle.dart';
import 'package:app_accounting/view/widget/customertextfield.dart';
import 'package:flutter/material.dart';
// class Colorstyle is now imported from core/colorstyle.dart

class SigninScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final colorstyle = Colorstyle();
  final controller = AuthController();

  SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorstyle.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Login or Register",
          style: Fontstyle.titleStyle,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('images/accountinglogo.png'),
            SizedBox(height: 30),
            CustomTextField(
              controller: emailController,
              labelText: "Email",
              obscureText: false,
              colorstyle: colorstyle,
              onChanged: (value) {},
            ),
            SizedBox(height: 30),
            CustomTextField(
              controller: passwordController,
              labelText: "Password",
              obscureText: true,
              colorstyle: colorstyle,
              onChanged: (value) {},
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    controller.login(
                      emailController.text,
                      passwordController.text,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorstyle.buttonColor,
                  ),
                  child: Text(
                    "Login",
                    style: Fontstyle.bottonfontStyle,
                  ),
                ),
                SizedBox(height: 15),
                Opacity(
                  opacity: 0.3,
                  child: Text('-- OR --', style: Fontstyle.titleStyle),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    controller.register(
                      emailController.text,
                      passwordController.text,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorstyle.buttonColor,
                  ),
                  child: Text("Register", style: Fontstyle.bottonfontStyle),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
