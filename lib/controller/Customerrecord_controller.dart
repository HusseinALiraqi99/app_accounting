import 'package:get/get.dart';
import 'package:flutter/material.dart';

// ✅ كلاس لتخزين بيانات الدفع لكل زبون
class PaymentRecord {
  double amount;
  DateTime date;

  PaymentRecord({required this.amount, required this.date});
}

// ✅ كلاس الزبون مع قائمة المدفوعات
class Customer {
  String name;
  String product;
  double totalAmount;
  List<PaymentRecord> payments;

  double get paidAmount => payments.fold(0, (sum, p) => sum + p.amount);
  double get remainingAmount => totalAmount - paidAmount;

  Customer({
    required this.name,
    required this.product,
    required this.totalAmount,
    List<PaymentRecord>? payments,
  }) : payments = payments ?? [];
}

class CustomerRecordController extends GetxController {
  var customers = <Customer>[].obs;
  var searchQuery = ''.obs;

  void addCustomer(String name, String product, double totalAmount) {
    customers
        .add(Customer(name: name, product: product, totalAmount: totalAmount));
  }

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
    customers.removeWhere((customer) => customer.name == name);
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void addPayment(String customerName, double amount) {
    int index = customers.indexWhere((c) => c.name == customerName);
    if (index != -1) {
      double paidAmount = customers[index].paidAmount; // إجمالي المدفوعات
      double remainingAmount =
          customers[index].remainingAmount; // المبلغ المتبقي

      if (paidAmount + amount > customers[index].totalAmount) {
        // إذا كان المبلغ المدفوع الجديد يتجاوز المبلغ الكلي
        Get.snackbar(
          "خطأ",
          "لا يمكنك دفع أكثر من المبلغ الكلي الذي هو ${customers[index].totalAmount}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        // إضافة الدفع إذا كان المبلغ صحيحًا
        customers[index]
            .payments
            .add(PaymentRecord(amount: amount, date: DateTime.now()));
        customers.refresh();
      }
    }
  }
}
