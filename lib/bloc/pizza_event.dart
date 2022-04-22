part of 'pizza_bloc.dart';

@immutable
abstract class PizzaEvent {
  const PizzaEvent();
}

class LoadPizzaEvent extends PizzaEvent{
  final List<PizzaModel> pizzas;

  const LoadPizzaEvent(this.pizzas);
}

class AddPizzaEvent extends PizzaEvent {
  final PizzaModel pizzaModel;

  const AddPizzaEvent(this.pizzaModel);
}

class RemovePizzaEvent extends PizzaEvent {
  final PizzaModel pizzaModel;

  const RemovePizzaEvent(this.pizzaModel);
}
