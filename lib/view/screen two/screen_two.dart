import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:machine_test/constants.dart';
import 'package:machine_test/controller/screen_one_controller.dart';

import '../../model/dbdrinks.dart';
import 'package:http/http.dart' as http;

class ScreenTwo extends StatelessWidget {
  ScreenTwo({Key? key}) : super(key: key);

  Box<LocalDrinks> box = Hive.box<LocalDrinks>("localdrinks");

  String? base64;

  @override
  Widget build(BuildContext context) {
    ScreenOneController twoController = Get.find<ScreenOneController>();
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            label: const Text('Refresh'),
            onPressed: () async {
              twoController.fetchProducts();
            }),
        body: GetBuilder<ScreenOneController>(
          initState: (state) {
            print("afkjljlfkjldalkdklfkl");
            twoController.fetchProducts();
          },
          builder: (controller) {
            return Obx(() {
              if (controller.noConnection.value) {
                //  List<> offlineData = box.toMap().values.toList();

                // List<LocalDrinks>? list = box.values.toList()[0];
                // print("HEEEEEEEEEEEEEEEELLLLLLLLLLLLo");
                // print(box.toMap());
                print(box.values.length);

                // return Text("No connection ${controller.noConnection.value}");

                List<LocalDrinks> offlineData = box.values.toList();

                if (offlineData.isEmpty) {
                  return Center(
                    child: Text('Please turn on the internet'),
                  );
                }

                return Column(
                  children: [
                    kHeight10,
                    Text(
                      'Fetched from local database',
                      style: TextStyle(
                        fontSize: 15,
                        color: kRedColor,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: offlineData.length,
                        itemBuilder: (context, index) {
                          String? name = offlineData[index].name;
                          String? category = offlineData[index].category;
                          String? image = offlineData[index].photo;
                          String? measure = offlineData[index].oz;
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: MemoryImage(
                                base64Decode(image),
                              ),
                            ),
                            title: Text(name),
                            subtitle: Text(category),
                            trailing: Text(measure),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else if (controller.productList == null) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                children: [
                  Text(
                    'Fetched from API',
                    style: TextStyle(
                      fontSize: 15,
                      color: kRedColor,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.productList!['drinks'].length,
                      itemBuilder: (context, index) {
                        String? name = controller.productList!['drinks'][index]
                            ['strDrink'];
                        String? category = controller.productList!['drinks']
                            [index]['strCategory'];
                        String? image = controller.productList!['drinks'][index]
                            ['strDrinkThumb'];
                        String? measure = controller.productList!['drinks']
                            [index]['strMeasure1'];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(image!),
                          ),
                          title: Text(name!),
                          subtitle: Text(category!),
                          trailing: Text(measure!),
                        );
                      },
                    ),
                  ),
                ],
              );
            });
          },
        ));
  }
}
