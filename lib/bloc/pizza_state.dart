part of 'pizza_bloc.dart';

@immutable
abstract class PizzaState {
  const PizzaState();
}

class PizzaInitialState extends PizzaState {}

class PizzasLoadedState extends PizzaState{
  final List<PizzaModel> pizzas;

  const PizzasLoadedState(this.pizzas);
}


