import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/models/pizza_models.dart';

part 'pizza_events.dart';

part 'pizza_states.dart';

class PizzaBloc extends Bloc<PizzaEvents, PizzaStates> {
  PizzaBloc() : super(PizzaInitial()) {
    on<LoadPizzaCounter>(_onLoadPizzaCounter);
    on<AddPizza>(_onAddPizza);
    on<RemovePizza>(_onRemovePizza);
  }

  void _onLoadPizzaCounter(event, emit) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    emit(const PizzaLoaded(pizzas: []));
  }

  void _onAddPizza(AddPizza event, emit) {
    if (state is PizzaLoaded) {
      final state = this.state as PizzaLoaded;
      emit(
        PizzaLoaded(
          pizzas: List.from(state.pizzas)..add(event.pizzaModel),
        ),
      );
    }
  }

  void _onRemovePizza(RemovePizza event, emit) {
    if (state is PizzaLoaded) {
      final state = this.state as PizzaLoaded;
      emit(PizzaLoaded(
          pizzas: List.from(state.pizzas)..remove(event.pizzaModel)));
    }
  }
}
