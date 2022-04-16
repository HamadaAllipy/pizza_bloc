part of 'pizza_bloc.dart';

abstract class PizzaStates {
  const PizzaStates();
}

class PizzaInitialState extends PizzaStates {}

class PizzaDataLoadedState extends PizzaStates {
  final List<PizzaModel> pizzas;

  const PizzaDataLoadedState({required this.pizzas});
}
