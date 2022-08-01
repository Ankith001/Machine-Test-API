import 'dart:developer';
import 'package:get/get.dart';
import 'package:machine_test/model/medicines.dart';
import 'package:machine_test/model/users.dart';
import 'package:machine_test/services/service_one.dart';
import 'package:machine_test/services/service_three.dart';
import 'package:machine_test/services/service_two.dart';

class ScreenOneController extends GetxController {
  Medicines? data;
  Map? productList;
  User? user;

  RxBool noConnection = false.obs; 

  check() async {
    data = null;
    data = await ServiceOne().getMedDetails();
    log(data.toString());
    update();
  }

  void fetchProducts() async {
    print("afd");
    productList = await ServiceTwo().getDrinkDetails();
    update();
  }

  void fetchUsers() async {
    user = null;
    user = await ServiceThree().getUserDetails();
    update();
  }
}
