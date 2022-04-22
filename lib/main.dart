import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

import 'app.dart';
import 'app_bloc_observer.dart';

void main() async{


  BlocOverrides.runZoned(() => runApp(const PizzaApp()),
      blocObserver: AppBlocObserver());
}
