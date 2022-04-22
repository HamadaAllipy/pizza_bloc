import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/bloc/pizza_bloc.dart';

import '../data/pizza_model.dart';
import 'second_screen.dart';

class PizzaView extends StatelessWidget {
  const PizzaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pizza Counter',
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[800],
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      body: BlocBuilder<PizzaBloc, PizzaState>(
        builder: (context, state) {
          if (state is PizzaInitialState) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.orange[800],
              ),
            );
          }
          if (state is PizzasLoadedState) {
            return Center(
              child: Column(
                children: [
                  Text(
                    '${state.pizzas.length}',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        for(int index = 0; index < state.pizzas.length; index++)...[
                          Positioned(
                            top: random.nextInt(400).toDouble(),
                            left: random.nextInt(300).toDouble(),
                            child: SizedBox(
                              width: 150,
                              height: 150,
                              child: state.pizzas[index].image,
                            ),
                          ),
                        ]

                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: Text(
              'Some went error',
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: (){
              context.read<PizzaBloc>().add(AddPizzaEvent(PizzaModel.pizzas[0]));
            },
            backgroundColor: Colors.orange[800],
            child: const Icon(
              Icons.local_pizza,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () {
              context.read<PizzaBloc>().add(RemovePizzaEvent(PizzaModel.pizzas[0]));
            },
            backgroundColor: Colors.orange[800],
            child: const Icon(
              Icons.remove,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: 'btn3',
            onPressed: () {
              context.read<PizzaBloc>().add(AddPizzaEvent(PizzaModel.pizzas[1]));
            },
            backgroundColor: Colors.orange[800],
            child: const Icon(
              Icons.local_pizza_outlined,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: 'btn4',
            onPressed: () {
              context.read<PizzaBloc>().add(RemovePizzaEvent(PizzaModel.pizzas[1]));
            },
            backgroundColor: Colors.orange[800],
            child: const Icon(
              Icons.remove,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: 'btn5',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const SecondScreen()));
            },
            backgroundColor: Colors.orange[800],
            child: const Icon(
              Icons.remove,
            ),
          ),
        ],
      ),
    );
  }
}
