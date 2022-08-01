
import 'package:flutter/material.dart';
import 'package:machine_test/constants.dart';
import 'package:machine_test/view/screen%20one/screen_one.dart';
import 'package:machine_test/view/screen%20three/screen_three.dart';
import 'package:machine_test/view/screen%20two/screen_two.dart';
import 'package:machine_test/view/search_screen.dart';

class ScreenMainPage extends StatelessWidget {
  const ScreenMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
        body: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Home",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 28),
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {
              showSearch(context: context, delegate: SearchScreen());
            }, icon: const Icon(Icons.search))
          ],
          bottom: const TabBar(
            tabs: [
              Text(
                "Screen1", 
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Screen2",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Screen3",
                style: TextStyle(fontSize: 20),
              ),
            ],
            labelColor: Colors.black,
            indicatorWeight: 3,
            indicatorColor: kRedColor, 
          ),
        ),
        body: TabBarView(children: [
        ScreenOne(),
        ScreenTwo(),
        ScreenThree() 
        ]),
      ),
    ));
  }
}
