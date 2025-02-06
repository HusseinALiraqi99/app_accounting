import 'package:app_accounting/controller/Customerrecord_controller.dart';
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
                    title: Text(
                      customer.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('المنتج: ${customer.product}'),
                        Text('المبلغ الكلي: ${customer.totalAmount}'),
                        Text('المبلغ المدفوع: ${customer.paidAmount}'),
                        Text('المبلغ المتبقي: ${customer.remainingAmount}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
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
                          return AlertDialog(
                            title: Text('تفاصيل الزبون'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('الاسم: ${customer.name}'),
                                  Text('المنتج: ${customer.product}'),
                                  Text('المبلغ الكلي: ${customer.totalAmount}'),
                                  Text(
                                      'المبلغ المدفوع: ${customer.paidAmount}'),
                                  Text(
                                      'المبلغ المتبقي: ${customer.remainingAmount}'),
                                  SizedBox(height: 20),
                                  TextField(
                                    controller: paidAmountController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: 'إضافة مبلغ مدفوع',
                                    ),
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
                                    child: Text("إضافة المبلغ"),
                                  ),
                                  SizedBox(height: 20),
                                  Text("سجل المدفوعات:"),
                                  SizedBox(height: 10),
                                  Obx(() => Container(
                                        height: 200,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: customer.payments.length,
                                          itemBuilder: (context, index) {
                                            final payment =
                                                customer.payments[index];
                                            return ListTile(
                                              title: Text(
                                                  "المبلغ: ${payment.amount}"),
                                              subtitle: Text(
                                                "التاريخ: ${payment.date.day}/${payment.date.month}/${payment.date.year} - ${payment.date.hour}:${payment.date.minute}",
                                              ),
                                            );
                                          },
                                        ),
                                      )),
                                ],
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
