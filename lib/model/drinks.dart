// To parse this JSON data, do
//
//     final drinks = drinksFromJson(jsonString);

import 'dart:convert';

Drinks drinksFromJson(String str) => Drinks.fromJson(json.decode(str));

String drinksToJson(Drinks data) => json.encode(data.toJson());

class Drinks {
    Drinks({
       required this.drinks,
    });

    List<Map<String, String>> drinks;

    factory Drinks.fromJson(Map<String, dynamic> json) => Drinks(
        drinks: List<Map<String, String>>.from(json["drinks"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
    );

    Map<String, dynamic> toJson() => {
        "drinks": List<dynamic>.from(drinks.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
    };
}
