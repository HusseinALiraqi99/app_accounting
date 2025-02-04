import 'package:get/get.dart';

class Customer {
  String name;
  String product;
  String totalAmount;

  Customer(
      {required this.name, required this.product, required this.totalAmount});
}

class CustomerRecordController extends GetxController {
  var customers = <Customer>[].obs;
  var searchQuery = ''.obs;

  void addCustomer(String name, String product, String totalAmount) {
    customers
        .add(Customer(name: name, product: product, totalAmount: totalAmount));
  }

  // تصفية قائمة الزبائن بناءً على البحث
  List<Customer> get filteredCustomers {
    if (searchQuery.isEmpty) {
      return customers;
    } else {
      return customers
          .where((customer) => customer.name
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }

  void deleteCustomer(String name) {
    // نبحث عن الزبون المطابق للاسم في قائمة الزبائن الكاملة
    int index = customers.indexWhere((customer) => customer.name == name);

    // إذا وجدنا الزبون المطابق، نحذفه
    if (index != -1) {
      customers.removeAt(index);
    }
  }

// 🔹 تحديث البحث
  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }
}
