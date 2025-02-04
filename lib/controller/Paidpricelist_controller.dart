import 'package:get/get.dart';

// ✅ إنشاء كلاس Paidpricelist لتخزين بيانات السعر المدفوع
class Paidpricelist {
  String paidpricelist;

  Paidpricelist({required this.paidpricelist});
}

class PaidpricelistController extends GetxController {
  // ✅ تعريف قائمة من الأسعار المدفوعة بدلاً من String واحد
  var paidpricelist = <Paidpricelist>[].obs;

  // ✅ تعديل الدالة لاستخدام القائمة الصحيحة
  void addPaidpricelist(String paidPrice) {
    paidpricelist.add(Paidpricelist(paidpricelist: paidPrice));
  }
}
