part of 'pizza_bloc.dart';


/// loadPizzaCounter, AddPizza , RemovePizza
abstract class PizzaEvents extends Equatable {
  const PizzaEvents();

  @override
  List<Object?> get props => [];
}

class LoadPizzaCounter extends PizzaEvents {}

class AddPizza extends PizzaEvents  {
  final PizzaModel pizzaModel;

  const AddPizza({required this.pizzaModel});

  @override
  List<Object> get props => [pizzaModel];
}

class RemovePizza extends PizzaEvents {
  final PizzaModel pizzaModel;

  const RemovePizza({required this.pizzaModel});

  @override
  List<Object> get props => [pizzaModel];
}
