import 'package:flutter/material.dart';

import 'view/pizza_page.dart';

class PizzaApp extends MaterialApp {
  const PizzaApp({Key? key})
      : super(
            key: key,
            debugShowCheckedModeBanner: false,
            home: const PizzaPage());
}
