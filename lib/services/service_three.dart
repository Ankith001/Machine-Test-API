import 'dart:convert';
import 'dart:developer';

import 'package:machine_test/model/drinks.dart';

import 'package:http/http.dart' as http;
import 'package:machine_test/model/users.dart';

class ServiceThree {
  Future<User?> getUserDetails() async {
  
    try {
      var client = http.Client();
      var uri = Uri.parse(
          'https://randomuser.me/api/');
      var response = await client.get(uri);
      var json = response.body;

      Map<String,dynamic> data = jsonDecode(json);

      // print(data);
      // print("111111111111111111111111111111111111111111111");
      
       User? user = User.fromJson(data);
       
      //  print(user.results![0].name!.first);
      //  print("NAMMMMMMMWE");
      // resp = Drinks.fromJson(data);
      // print(resp.toString());
      // print(user.results![0].picture!.medium);
      return user;
    } catch (e) {
      print(e);
      log(e.toString());
    }
  }
}
