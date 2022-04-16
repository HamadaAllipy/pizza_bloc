import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/bloc/pizza_bloc.dart';

import '../models/pizza_models.dart';

class PizzaView extends StatelessWidget {
  const PizzaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'The Pizza Bloc',
          style: TextStyle(),
        ),
        backgroundColor: Colors.orange[800],
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<PizzaBloc, PizzaStates>(
          builder: (context, state) {
            if (state is PizzaInitial) {
              return CircularProgressIndicator(
                backgroundColor: Colors.orange[800],
              );
            }
            if (state is PizzaLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${state.pizzas.length}',
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        for (int index = 0;
                            index < state.pizzas.length;
                            index++)
                          Positioned(
                            left: random.nextInt(250).toDouble(),
                            top: random.nextInt(400).toDouble(),
                            child: SizedBox(
                              height: 150,
                              width: 150,
                              child: state.pizzas[index].image,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const Text(
              'Something went wrong!',
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.local_pizza_outlined),
            backgroundColor: Colors.orange[800],
            onPressed: () {
              context.read<PizzaBloc>().add(AddPizza(pizzaModel: PizzaModel.pizzas[0]));
            },
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            backgroundColor: Colors.orange[800],
            onPressed: () {
              context.read<PizzaBloc>().add(RemovePizza(pizzaModel: PizzaModel.pizzas[0]));
            },
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: const Icon(Icons.local_pizza_outlined),
            backgroundColor: Colors.orange[800],
            onPressed: () {
              context.read<PizzaBloc>().add(AddPizza(pizzaModel: PizzaModel.pizzas[1]));
            },
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            backgroundColor: Colors.orange[800],
            onPressed: () {
              context.read<PizzaBloc>().add(RemovePizza(pizzaModel: PizzaModel.pizzas[1]));
            },
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
