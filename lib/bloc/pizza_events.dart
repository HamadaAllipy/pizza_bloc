part of 'pizza_bloc.dart';

abstract class PizzaEvents{
  const PizzaEvents();
}

class LoadPizzaEvent extends PizzaEvents{

  final List<PizzaModel> pizzas;
  const LoadPizzaEvent({required this.pizzas});
}
class AddPizzaEvent extends PizzaEvents{
  final PizzaModel pizza;
  AddPizzaEvent({required this.pizza});
}
class RemovePizzaEvent extends PizzaEvents{

  final PizzaModel pizza;

  RemovePizzaEvent({required this.pizza});
}