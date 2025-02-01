import 'package:app_accounting/controller/auth/Customerrecord_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                            Text('المبلغ: ${customer.totalAmount}'),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            customerController.deleteCustomer(customer.name);
                          },
                        ),
                        onTap: () {
                          TextEditingController paidAmountController =
                              TextEditingController();

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                insetPadding: EdgeInsets.all(10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            customer.name,
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.close),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Text('المنتج: ${customer.product}',
                                          style: TextStyle(fontSize: 18)),
                                      SizedBox(height: 10),
                                      Text(
                                          'المبلغ المتبقي: ${customer.totalAmount}',
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.red)),
                                      Spacer(),

                                      // 🔹 إدخال المبلغ المدفوع
                                      TextField(
                                        controller: paidAmountController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'المبلغ المدفوع',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      SizedBox(height: 10),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            child: Text('إغلاق'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          SizedBox(width: 10),
                                          TextButton(
                                            child: Text('حفظ'),
                                            onPressed: () {
                                              double paidAmount =
                                                  double.tryParse(
                                                          paidAmountController
                                                              .text) ??
                                                      0.0;
                                              if (paidAmount > 0) {
                                                customerController
                                                    .updatePaidAmount(
                                                        customer.name,
                                                        paidAmount);
                                              }
                                            },
                                          ),
                                        ],
                                      ),
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
              }
            },
          ),
        ),
      ],
    );
  }
}
