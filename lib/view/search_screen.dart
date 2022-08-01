import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:machine_test/model/dbdrinks.dart';

class SearchScreen extends SearchDelegate {
  Box<LocalDrinks> box = Hive.box<LocalDrinks>("localdrinks");

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<LocalDrinks> offlineData = box.values.toList();

    offlineData = query.isEmpty
        ? offlineData
        : offlineData
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<LocalDrinks> offlineData = box.values.toList();

    offlineData = query.isEmpty
        ? offlineData
        : offlineData
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    // TODO: implement buildSuggestions
    return ListView.builder(
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
    );
  }
}
