import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PizzaModel extends Equatable {
  final int id;
  final String name;
  final Image image;

  const PizzaModel({
    required this.name,
    required this.id,
    required this.image,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, image];

  static List<PizzaModel> pizzas = [
    PizzaModel(
      id: 0,
      name: 'Pizza',
      image: Image.asset('assets/pizza.png'),
    ),
    PizzaModel(
      id: 1,
      name: 'Pizza Pepperoni ',
      image: Image.asset('assets/pizza_pepperoni.png'),
    ),
  ];
}
