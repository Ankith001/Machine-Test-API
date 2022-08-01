import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:hive/hive.dart';
import 'package:machine_test/controller/screen_one_controller.dart';
import 'package:machine_test/model/dbdrinks.dart';
import 'package:machine_test/model/drinks.dart';

import 'package:http/http.dart' as http;

class ServiceTwo {
  Future<Map<String, dynamic>?> getDrinkDetails() async {
    ScreenOneController controller = Get.find<ScreenOneController>();
    try {
      var client = http.Client();
      var uri = Uri.parse(
          'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=mar');
      var response = await client.get(uri);
      var json = response.body;
      // print(json);
      Map<String, dynamic> data = jsonDecode(json);
      List list = data['drinks'];

      controller.noConnection.value = false;
      addToBox(list);

      return data;
    } on SocketException catch (e) {
      // Box<List<LocalDrinks>> box = Hive.box<List<LocalDrinks>>("localdrinks");
      // // List<LocalDrinks>? list = box.values.toList()[0];
      // print("HEEEEEEEEEEEEEEEELLLLLLLLLLLLo");
      // print(box.values.toString());
      controller.noConnection.value = true;
      print("NO CONNECTION IS ${controller.noConnection.value}");
    } catch (e) {
      print(e);
      log(e.toString());
    }
  }
}

Future<void> addToBox(List localDrinks) async {
  Box<LocalDrinks> box = Hive.box<LocalDrinks>("localdrinks");
  await box.clear();

  print("Box LENGTH ${box.length} LOCal Drinks ${localDrinks.length}");
  int index = 0;

  for (var item in localDrinks) {
    http.Response response = await http.get(
      Uri.parse(item['strDrinkThumb']),
    );
    index++;

    final data = response.bodyBytes;

    final base64 = base64Encode(data);

    await box.add(
      LocalDrinks(
        name: item['strDrink'],
        category: item['strCategory'],
        photo: base64,
        oz: item['strMeasure1'],
      ),
    );

    print(index);
  }

  // await box.put("offlineData", values);
  // List<LocalDrinks>? list = box.get("offlineData");
  print("HEEEEEEEEEEEEEEEELLLLLLLLLLLLo");
  print(box.values.length);
  // print(list);
}
