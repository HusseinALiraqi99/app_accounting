import 'package:app_accounting/controller/Customerrecord_controller.dart';
import 'package:app_accounting/core/colorstyle.dart';
import 'package:app_accounting/core/fontstyle.dart';
import 'package:app_accounting/view/widget/customertextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// صفحة تابعة للصفحة الرئيسية تعرض قائمة الزبائن
class ListCustomer extends StatelessWidget {
  final CustomerRecordController customerController;
  const ListCustomer({super.key, required this.customerController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: customerController.updateSearchQuery,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              labelText: 'بحث عن زبون',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Expanded(
          child: Obx(() {
            if (customerController.filteredCustomers.isEmpty) {
              return Center(child: Text('لا يوجد زبائن'));
            }
            return ListView.builder(
              itemCount: customerController.filteredCustomers.length,
              itemBuilder: (context, index) {
                final customer = customerController.filteredCustomers[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    tileColor: Colors.blue[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    title: Text(
                      customer.name,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'المنتج: ${customer.product}',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          'المبلغ الكلي: ${customer.totalAmount}',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          'المبلغ المدفوع: ${customer.paidAmount}',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          'المبلغ المتبقي: ${customer.remainingAmount}',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                    leading: IconButton(
                      icon: Icon(Icons.delete, color: Colors.white),
                      onPressed: () {
                        customerController.deleteCustomer(customer.name);
                      },
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          TextEditingController paidAmountController =
                              TextEditingController();
                          return SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Dialog(
                              insetPadding: EdgeInsets.zero,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 10,
                                  children: [
                                    Text(
                                      'تفاصيل الزبون',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.amber[900],
                                          fontSize: 40),
                                    ),
                                    Text(
                                      'الاسم: ${customer.name}',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                    Text(
                                      'المنتج: ${customer.product}',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                    Text(
                                      'المبلغ الكلي: ${customer.totalAmount}',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                    Text(
                                      'المبلغ المدفوع: ${customer.paidAmount}',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                    Text(
                                      'المبلغ المتبقي: ${customer.remainingAmount}',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                    SizedBox(height: 20),
                                    CustomTextField(
                                      controller: paidAmountController,
                                      labelText: 'المبلغ المدفوع',
                                      obscureText: false,
                                      colorstyle: Colorstyle(),
                                      onChanged: (value) {},
                                    ),
                                    SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {
                                        double? enteredAmount = double.tryParse(
                                            paidAmountController.text.trim());
                                        if (enteredAmount != null &&
                                            enteredAmount > 0) {
                                          customerController.addPayment(
                                              customer.name, enteredAmount);
                                          paidAmountController.clear();
                                          Get.back();
                                        } else {
                                          Get.snackbar(
                                            "خطأ",
                                            "يرجى إدخال مبلغ صالح",
                                            snackPosition: SnackPosition.BOTTOM,
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colorstyle().buttonColor,
                                      ),
                                      child: Text(
                                        "دفع المبلغ",
                                        style: Fontstyle.bottonfontStyle,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colorstyle().buttonColor,
                                      ),
                                      child: Text(
                                        "رجوع",
                                        style: Fontstyle.bottonfontStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
