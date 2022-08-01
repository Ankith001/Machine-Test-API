import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/constants.dart';
import 'package:machine_test/controller/screen_one_controller.dart';

import 'package:machine_test/model/medicines.dart';
import 'package:machine_test/services/service_one.dart';

class ScreenOne extends StatefulWidget {
  ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  Medicines? data;
  //  List<Medicines>? Meds;

  //  var isLoaded = false;

  @override
  Widget build(BuildContext context) {
    // check();
    // ServiceOne().getMedDetails();
    ScreenOneController oneController = Get.put(ScreenOneController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        oneController.check();
      }),
      body: GetBuilder<ScreenOneController>(
        //  init: ScreenOneController(),
        initState: (state) {
          print("object");
          oneController.check();
        },
        builder: (controller) {
          return controller.data == null
              ? Center(child: const CircularProgressIndicator())
              : Column(
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      color: kRedColor,
                      child: Column(
                      children: [
                        Text(
                          controller
                              .data!
                              .problems[0]
                              .diabetes
                              .first
                              .medications[0]
                              .medicationsClasses[0]
                              .className[0]
                              .associatedDrug[0]
                              .name
                              .toString(),
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(controller
                            .data!
                            .problems[0]
                            .diabetes
                            .first
                            .medications[0]
                            .medicationsClasses[0]
                            .className[0]
                            .associatedDrug2[0]
                            .strength
                            .toString()),
                        Text(controller
                            .data!
                            .problems[0]
                            .diabetes
                            .first
                            .medications[0]
                            .medicationsClasses[0]
                            .className[0]
                            .associatedDrug2[0]
                            .dose
                            .toString()),
                      ],)
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      color: kRedColor,
                      child: Column(
                      children: [
                        Text(
                          controller
                              .data!
                              .problems[0]
                              .diabetes
                              .first
                              .medications[0]
                              .medicationsClasses[0]
                              .className2[0]
                              .associatedDrug2[0]
                              .name
                              .toString(),
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(controller
                            .data!
                            .problems[0]
                            .diabetes
                            .first
                            .medications[0]
                            .medicationsClasses[0]
                            .className2[0]
                            .associatedDrug2[0]
                            .strength
                            .toString()),
                        Text(controller
                            .data!
                            .problems[0]
                            .diabetes
                            .first
                            .medications[0]
                            .medicationsClasses[0]
                            .className2[0]
                            .associatedDrug2[0]
                            .dose
                            .toString()),
                      ],)
                    ),
                  ],
                );
        },
      ),
    );
  }
}
