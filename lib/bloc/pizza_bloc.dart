import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pizza/data/pizza_model.dart';

part 'pizza_event.dart';
part 'pizza_state.dart';

class PizzaBloc extends Bloc<PizzaEvent, PizzaState> {
  PizzaBloc() : super(PizzaInitialState()) {
    on<LoadPizzaEvent>(_onLoadPizza);
    on<AddPizzaEvent>(_onAddPizza);
    on<RemovePizzaEvent>(_onRemovePizza);
  }

  FutureOr<void> _onLoadPizza(LoadPizzaEvent event, Emitter<PizzaState> emit)async {
    await Future.delayed(const Duration(seconds: 1));
    emit(const PizzasLoadedState([]));
  }

  FutureOr<void> _onAddPizza(AddPizzaEvent event, Emitter<PizzaState> emit) {
    if(state is PizzasLoadedState){
      final state = this.state as PizzasLoadedState;
      emit(PizzasLoadedState(List.from(state.pizzas)..add(event.pizzaModel)));
    }
  }

  FutureOr<void> _onRemovePizza(RemovePizzaEvent event, Emitter<PizzaState> emit) {
    if(state is PizzasLoadedState){
      final state = this.state as PizzasLoadedState;
      emit(PizzasLoadedState(List.from(state.pizzas)..remove(event.pizzaModel)));

    }
  }
}
