part of 'pizza_bloc.dart';

abstract class PizzaStates extends Equatable {

  const PizzaStates();
  @override
  List<Object?> get props => [];
}

class PizzaInitial extends PizzaStates{

}
class PizzaLoaded extends PizzaStates{

  final List<PizzaModel> pizzas;
  const PizzaLoaded({required this.pizzas});

  @override
  List<Object> get props => [pizzas];
}
