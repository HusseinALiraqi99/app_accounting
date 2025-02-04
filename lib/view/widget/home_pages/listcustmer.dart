import 'package:app_accounting/controller/Customerrecord_controller.dart';
import 'package:app_accounting/controller/Paidpricelist_controller.dart';
import 'package:app_accounting/core/colorstyle.dart';
import 'package:app_accounting/view/widget/customertextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// صفحة تابعة للصفحة الرئيسية تعرض قائمة الزبائن
class listcustmer extends StatelessWidget {
  const listcustmer({
    super.key,
    required this.customerController,
  });

  final CustomerRecordController customerController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔹 صندوق البحث
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) => customerController.updateSearchQuery(value),
            decoration: InputDecoration(
              labelText: 'بحث عن زبون',
              prefixIcon: Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),

        // 🔹 قائمة الزبائن
        Expanded(
          child: Obx(
            () {
              if (customerController.filteredCustomers.isEmpty) {
                return Center(
                  child: Text('لا يوجد زبائن'),
                );
              } else {
                return ListView.builder(
                  itemCount: customerController.filteredCustomers.length,
                  itemBuilder: (context, index) {
                    final customer =
                        customerController.filteredCustomers[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: ListTile(
                          title: Text(customer.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('المنتج: ${customer.product}'),
                              Text('المبلغ الكي : ${customer.totalAmount}'),
                            ],
                          ),
                          // 🔹 زر حذف الزبون
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              customerController.deleteCustomer(customer.name);
                            },
                          ),
                          onTap: () {
                            TextEditingController paidAmountController =
                                TextEditingController();
                            final paidpricelistController =
                                Get.put(PaidpricelistController());
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('تفاصيل الزبون'),
                                  content: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.9, // 60% من عرض الشاشة
                                    height: MediaQuery.of(context).size.height *
                                        0.9, // 40% من ارتفاع الشاشة
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize
                                          .min, // يجعل المحتوى يأخذ حجمه الطبيعي
                                      children: [
                                        Text('الاسم: ${customer.name}'),
                                        Text('المنتج: ${customer.product}'),
                                        Text(
                                            'المبلغ الكلي: ${customer.totalAmount}'),
                                        SizedBox(height: 20),
                                        CustomTextField(
                                          controller: paidAmountController,
                                          labelText: "المبلغ المدفوع",
                                          obscureText: false,
                                          colorstyle: Colorstyle(),
                                          onChanged: (value) {
                                            if (value.isEmpty) {
                                              paidpricelistController
                                                  .addPaidpricelist(value);
                                            }
                                          },
                                        ),
                                        SizedBox(height: 20),
                                        // ✅ زر الإضافة عند الضغط
                                        ElevatedButton(
                                          onPressed: () {
                                            String enteredAmount =
                                                paidAmountController.text
                                                    .trim();
                                            if (enteredAmount.isNotEmpty) {
                                              paidpricelistController
                                                  .addPaidpricelist(
                                                      enteredAmount); // إضافة المبلغ إلى القائمة
                                              paidAmountController
                                                  .clear(); // مسح الحقل بعد الإضافة
                                            } else {
                                              Get.snackbar("خطأ",
                                                  "يرجى إدخال مبلغ مدفوع",
                                                  snackPosition:
                                                      SnackPosition.BOTTOM);
                                            }
                                          },
                                          child: Text("إضافة المبلغ"),
                                        ),
                                        SizedBox(height: 20),
                                        Expanded(
                                            child: Obx(() => ListView.builder(
                                                  itemCount:
                                                      paidpricelistController
                                                          .paidpricelist.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return ListTile(
                                                      title: Text(
                                                          "المبلغ المدفوع: ${paidpricelistController.paidpricelist[index].paidpricelist}"),
                                                    );
                                                  },
                                                )))
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
