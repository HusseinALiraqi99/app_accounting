import 'package:app_accounting/core/colorstyle.dart';
import 'package:app_accounting/core/fontstyle.dart';
import 'package:app_accounting/view/widget/customertextfield.dart';
import 'package:flutter/material.dart';

class Addcustomer extends StatelessWidget {
  Addcustomer({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اضافة زبون'),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          CustomTextField(
            controller: controller,
            labelText: 'اسم الزبون',
            obscureText: false,
            colorstyle: Colorstyle(),
            onChanged: (value) {
              // Handle change
            },
          ),
          SizedBox(height: 30),
          CustomTextField(
            controller: controller,
            labelText: 'اسم المنتج',
            obscureText: false,
            colorstyle: Colorstyle(),
            onChanged: (value) {
              // Handle change
            },
          ),
          SizedBox(height: 30),
          CustomTextField(
            controller: controller,
            labelText: 'المبلغ الكلي ',
            obscureText: false,
            colorstyle: Colorstyle(),
            onChanged: (value) {
              // Handle change
            },
          ),
          SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {
              // Addcustomer your onPressed logic here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colorstyle().buttonColor,
            ),
            child: Text("اضافة", style: Fontstyle.bottonfontStyle),
          ),
        ],
      ),
    );
  }
}
