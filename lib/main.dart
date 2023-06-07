import 'package:bloc_pattern_demo/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/counter_cubit.dart';


void main() {
  final CounterState counterState1=CounterState(counterValue: 1,wasIncremented: false );
  final CounterState counterState2=CounterState(counterValue: 1,wasIncremented: false);
  print(counterState1 == counterState2);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(title: 'Flutter Demo Home Page',colors: Colors.blueAccent,),
      ),
    );
  }
}

