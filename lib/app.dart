import 'package:flutter/material.dart';
import 'package:pizza/view/home_page.dart';

class PizzaApp extends MaterialApp{
  const PizzaApp({Key? key}): super(key: key , home: const HomePage(), debugShowCheckedModeBanner: false);
}