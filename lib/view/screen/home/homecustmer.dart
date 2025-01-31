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
          SizedBox(height: 30),
          Container(
            child: CustomTextField(
              controller: TextEditingController(),
              labelText: "اسم الزبون",
              obscureText: false,
              colorstyle: Colorstyle(),
              onChanged: (value) {},
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(': اسم المنتج '),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              color: Colorstyle().coloritemes,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(': المبلغ الكلي '),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              color: Colorstyle().coloritemes,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(': المبلغ المتبقي لحد الان '),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              color: Colorstyle().coloritemes,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          SizedBox(height: 30),
          CustomTextField(
            controller: TextEditingController(),
            labelText: "المبلغ المستقطع ",
            obscureText: false,
            colorstyle: Colorstyle(),
            onChanged: (value) {},
          ),
          SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colorstyle().buttonColor,
            ),
            child: Text(
              'تاكيد',
              style: Fontstyle.bottonfontStyle,
              selectionColor: Colors.deepOrange,
            ),
          )
        ],
      ),
    );
  }
}
