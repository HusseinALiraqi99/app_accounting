import 'package:app_accounting/controller/Customerrecord_controller.dart';
import 'package:app_accounting/core/colorstyle.dart';
import 'package:app_accounting/core/fontstyle.dart';
import 'package:app_accounting/view/screen/home/addcustmer.dart';
import 'package:app_accounting/view/widget/customertextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: productController,
              labelText: "المنتج المباع",
              obscureText: false,
              colorstyle: Colorstyle(),
              onChanged: (value) {},
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: amountController,
              labelText: "المبلغ الكلي",
              obscureText: false,
              colorstyle: Colorstyle(),
              onChanged: (value) {},
              keyboardType: TextInputType.number, // إضافة هذا السطر
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
                    double.parse(amountController.text),
                  );

                  Get.back(); // الرجوع مع تحديث البيانات تلقائيًا
                }
              },
              child: Text('اضافة'),
            ),
            Obx(() {
              return Text(errorMessage.value, style: Fontstyle.bottonfontStyle);
            }),
          ],
        ),
      ),
    );
  }
}
