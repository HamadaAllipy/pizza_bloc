import 'package:flutter/material.dart';

class PizzaModel {
  final int id;
  final String name;
  final Image image;

  PizzaModel({
    required this.image,
    required this.id,
    required this.name,
  });

  static List<PizzaModel> pizzas = [
    PizzaModel(id: 0, image: Image.asset('assets/pizza.png'), name: 'pizza'),
    PizzaModel(id: 1, image: Image.asset('assets/pizza_pepperoni.png'), name: 'pizza pepperoni'),
  ];
}
