import 'dart:convert';
import 'dart:developer';

import 'package:machine_test/model/medicines.dart';
import 'package:http/http.dart' as http;

class ServiceOne {
  Future<Medicines>? getMedDetails() async {
    var res;
    log("Hellooooooooo");
    var client = http.Client();
    var uri = Uri.parse(
        'https://run.mocky.io/v3/09c0f01c-b874-4a29-9a1d-7de84cea89cb');
    var response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var json = response.body;
      var data = jsonDecode(json);
      res = Medicines.fromJson(data);
      log("completed");
    } else {}
    return res;
  }
}
