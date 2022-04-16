import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/bloc/pizza_bloc.dart';
import 'package:pizza/data/pizza_model.dart';

class PizzaView extends StatelessWidget {
  const PizzaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final random = Random();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
      ),
      body: BlocBuilder<PizzaBloc, PizzaStates>(
        builder: (context, state) {
          if (state is PizzaInitialState) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.orange[800],
              ),
            );
          }
          if (state is PizzaDataLoadedState) {
            return Column(
              children: [
                Text(
                  '${state.pizzas.length}',
                  style: textTheme.headline2!.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      for(int index = 0 ; index < state.pizzas.length; index++)
                        Positioned(
                          left: random.nextInt(250).toDouble(),
                          top: random.nextInt(400).toDouble(),
                          child: SizedBox(
                            width: 150,
                            height: 150,
                            child: state.pizzas[index].image,
                          ),
                        ),
                    ],
                  )
                ),
              ],
            );
          }
          return const Text(
            'Something went error',
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.local_pizza),
            onPressed: () {
              context.read<PizzaBloc>().add(AddPizzaEvent(pizza: PizzaModel.pizzas[0]));
            },
            backgroundColor: Colors.orange[800],
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<PizzaBloc>().add(RemovePizzaEvent(pizza: PizzaModel.pizzas[0]));
            },
            backgroundColor: Colors.orange[800],
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: const Icon(Icons.local_pizza_outlined),
            onPressed: () {
              context.read<PizzaBloc>().add(AddPizzaEvent(pizza: PizzaModel.pizzas[1]));
            },
            backgroundColor: Colors.orange[800],
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<PizzaBloc>().add(RemovePizzaEvent(pizza: PizzaModel.pizzas[1]));
            },
            backgroundColor: Colors.orange[800],
          ),
        ],
      ),
    );
  }
}
