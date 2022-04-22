import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/view/pizza_view.dart';

import '../bloc/pizza_bloc.dart';

class PizzaPage extends StatelessWidget {
  const PizzaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PizzaBloc()..add(const LoadPizzaEvent([])),
      child: const PizzaView(),
    );
  }
}
