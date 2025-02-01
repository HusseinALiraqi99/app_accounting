import 'package:app_accounting/controller/auth/Customerrecord_controller.dart'
    as auth;
import 'package:app_accounting/view/screen/home/addcustmer.dart';
import 'package:app_accounting/view/widget/home_pages/listcustmer.dart'
    as widget;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth.CustomerRecordController customerController = Get.find();

    return listseteing(customerController: customerController);
  }
}

class listseteing extends StatelessWidget {
  const listseteing({
    super.key,
    required this.customerController,
  });

  final auth.CustomerRecordController customerController;

  @override
  Widget build(BuildContext context) {
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
      body: widget.listcustmer(customerController: customerController),
    );
  }
}
