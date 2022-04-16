import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/bloc/pizza_bloc.dart';

import 'pizza_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MultiBlocProvider(providers: [
        BlocProvider(create: (_)=> PizzaBloc()..add(LoadPizzaCounter())),
    ], child: const PizzaView());
  }
}
