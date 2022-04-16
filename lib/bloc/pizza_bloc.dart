import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/data/pizza_model.dart';

part 'pizza_events.dart';

part 'pizza_states.dart';

class PizzaBloc extends Bloc<PizzaEvents, PizzaStates> {
  PizzaBloc() : super(PizzaInitialState()) {
    on<LoadPizzaEvent>(_onLoadPizza);
    on<AddPizzaEvent>(_onAddPizza);
    on<RemovePizzaEvent>(_onRemovePizza);
  }

  void _onLoadPizza(LoadPizzaEvent event, Emitter<PizzaStates> emit) async{
    await Future.delayed(const Duration(seconds: 2));
    emit(
        const PizzaDataLoadedState(pizzas: [])
    );
  }

  void _onAddPizza(AddPizzaEvent event, Emitter<PizzaStates> emit) {
    if(state is PizzaDataLoadedState){
      final state = this.state as PizzaDataLoadedState;
      emit(
          PizzaDataLoadedState(pizzas: List.from(state.pizzas)..add(event.pizza))
      );
    }
  }

  void _onRemovePizza(RemovePizzaEvent event, Emitter<PizzaStates> emit) {
    if(state is PizzaDataLoadedState){
      final state = this.state as PizzaDataLoadedState;
      emit(
        PizzaDataLoadedState(pizzas: List.from(state.pizzas)..remove(event.pizza))
      );
    }
  }
}
