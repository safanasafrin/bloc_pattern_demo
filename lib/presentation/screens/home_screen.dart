import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title, required this.colors});

  final String title;
  final Color colors;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          // TODO: implement listener
          if(state.wasIncremented ==true){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Inremented"),
                  duration: Duration(milliseconds: 300),
                )
            );
          }
          else if(state.wasIncremented==false){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Decremented"),
                  duration: Duration(milliseconds: 300),
                )
            );
          }

        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Counter value',
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  if (state.counterValue < 0) {
                    return Text(
                      'Negative' + state.counterValue.toString(),
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineSmall,
                    );
                  }
                  else if (state.counterValue % 2 == 0) {
                    return Text(
                      'yaaay even number' + state.counterValue.toString(),
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineSmall,
                    );
                  }
                  else {
                    return Text(
                      'Thats number' + state.counterValue.toString(),
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineSmall,
                    );
                  }
                },
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                        //context.bloc<CounterCubit>().decrement();
                      },
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                        //  context.bloc<CounterCubit>().increment();
                      },
                      tooltip: 'Decrement',
                      child: const Icon(Icons.add),
                    ),

                  ]
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}