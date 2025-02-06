import 'package:app_accounting/controller/Customerrecord_controller.dart';
import 'package:app_accounting/core/colorstyle.dart';
import 'package:app_accounting/core/fontstyle.dart';
import 'package:app_accounting/view/screen/home/addcustmer.dart';
import 'package:app_accounting/view/widget/customertextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addcustomer extends StatelessWidget {
  Addcustomer({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController productController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final CustomerRecordController customerController =
      Get.put(CustomerRecordController());

  final RxString errorMessage = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اضافة زبون'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: nameController,
              labelText: "الاسم",
              obscureText: false,
              colorstyle: Colorstyle(),
              onChanged: (value) {},
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: productController,
              labelText: "المنتج المباع",
              obscureText: false,
              colorstyle: Colorstyle(),
              onChanged: (value) {},
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: amountController,
              labelText: "المبلغ الكلي",
              obscureText: false,
              colorstyle: Colorstyle(),
              onChanged: (value) {},
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty ||
                    productController.text.isEmpty ||
                    amountController.text.isEmpty) {
                  errorMessage.value = 'يرجى ملء جميع الحقول';
                } else {
                  customerController.addCustomer(
                    nameController.text,
                    productController.text,
                    double.tryParse(amountController.text) ?? 0.0,
                  );
                  Get.back(); // الرجوع إلى الصفحة السابقة بعد الإضافة
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colorstyle().buttonColor,
              ),
              child: Text("اضافة", style: Fontstyle.bottonfontStyle),
            ),
            SizedBox(height: 20),

            // لون النص أحمر في حالة وجود خطأ
            Obx(() => Text(
                  errorMessage.value,
                  style: TextStyle(color: Colors.red),
                )),
          ],
        ),
      ),
    );
  }
}
