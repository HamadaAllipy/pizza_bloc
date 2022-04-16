import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/bloc/pizza_bloc.dart';
import 'package:pizza/view/pizza_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=> PizzaBloc()..add(const LoadPizzaEvent(pizzas: [])),child: const PizzaView(),);
  }
}
