import 'package:app_accounting/controller/auth/Customerrecord_controller.dart';
import 'package:app_accounting/view/screen/home/addcustmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addcustomer extends StatelessWidget {
  Addcustomer({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController productController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final CustomerRecordController customerController =
      Get.put(CustomerRecordController());

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
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'اسم الزبون'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: productController,
              decoration: InputDecoration(labelText: 'اسم المنتج'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'المبلغ الكلي'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                customerController.addCustomer(
                  nameController.text,
                  productController.text,
                  amountController.text,
                );
                Get.back(); // الرجوع إلى الصفحة السابقة بعد الإضافة
              },
              child: Text("اضافة"),
            ),
          ],
        ),
      ),
    );
  }
}
