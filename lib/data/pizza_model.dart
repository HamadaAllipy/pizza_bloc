import 'package:flutter/material.dart';

class PizzaModel {
  final int _id;
  final String _name;
  final Image _image;

  PizzaModel({
    required int id,
    required String name,
    required Image image,
  })  : _id = id,
        _image = image,
        _name = name;

  Image get image => _image;

  static List<PizzaModel> pizzas = [
    PizzaModel(id: 1, name: 'Pizza', image: Image.asset('assets/pizza.png')),
    PizzaModel(id: 2, name: 'Pizza Peperoni', image: Image.asset('assets/pizza_pepperoni.png')),
  ];
}
