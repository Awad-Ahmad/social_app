import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:social_app/Cubit/bloc_observer.dart';
import 'package:social_app/modules/login_screen.dart';

void main() {

  runApp(const MyApp());
  Bloc.observer=MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: LoginScreen(),


    );
  }
}

