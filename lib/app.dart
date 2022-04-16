import 'package:flutter/material.dart';

import 'view/home_page.dart';

class MyApp extends MaterialApp {
  const MyApp({Key? key})
      : super(
            key: key,
            home: const HomePage(),
            debugShowCheckedModeBanner: false);
}
