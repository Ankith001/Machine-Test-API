import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:machine_test/constants.dart';
import 'package:machine_test/controller/screen_one_controller.dart';
import 'package:machine_test/model/users.dart';
import 'package:machine_test/services/service_three.dart';

import '../../model/dbdrinks.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenOneController controller = Get.find<ScreenOneController>();

    return Scaffold(
      body: GetBuilder<ScreenOneController>(
        init: ScreenOneController(),
        initState: (state) {
          controller.fetchUsers();
        },
        builder: (controller) {
          User? user = controller.user;

         

          return user == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              // : ListView.builder(
              //     itemCount: user.results!.length,
              //     itemBuilder: (context, index) {
              //       return ListTile(
              //         leading: CircleAvatar(
              //           backgroundImage:
              //               NetworkImage(user.results![index].picture!.medium!),
              //         ),
              //         title: Text("${user.results![index].name!.title} "
              //                 "${user.results![index].name!.first!} " +
              //            user.results![index].name!.last!),
              //            subtitle: Text(user.results![index].email!),
              //       );
              //     },
              //   );
              : Card(
                  color: Color.fromARGB(255, 173, 161, 123),
                  child: Container(
                    height: 500,
                    child: Column(
                      children: [
                        kHeight10,
                        Center(
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                NetworkImage(user.results![0].picture!.medium!),
                          ),
                        ),
                        kHeight10,
                        Text("${user.results![0].name!.title} "
                                "${user.results![0].name!.first!} " +
                            user.results![0].name!.last!),
                        kHeight5,
                        Text(user.results![0].email!),
                        kHeight5,
                        Text("${user.results![0].location!.city!} " +
                            user.results![0].location!.country!)
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
