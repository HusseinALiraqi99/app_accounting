import 'package:app_accounting/controller/auth/Customerrecord_controller.dart';
import 'package:app_accounting/core/colorstyle.dart';
import 'package:app_accounting/core/fontstyle.dart';
import 'package:app_accounting/view/screen/home/addcustmer.dart';
import 'package:app_accounting/view/widget/customertextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomerRecordController customerController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('شركة الاتجاه الصاعد',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'القائمة الجانبية',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('الصفحة الرئيسية'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('الإعدادات'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.add_circle),
              title: Text('اضافة زبون '),
              onTap: () {
                Get.to(Addcustomer());
              },
            ),
          ],
        ),
      ),
      body: Column(
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
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(customer.name),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('المنتج: ${customer.product}'),
                                      Text('المبلغ: ${customer.totalAmount}'),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text('إغلاق'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
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
      ),
    );
  }
}
