import 'package:bloc_pattern_demo/logic/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main(){

  //organizing multiple test
  //eg:for counter cubit we will write the feature of counter feature
  group('CounterCubit', () {
    late CounterCubit counterCubit ;

    //common setup
    //setup-instantiate the objects for the test which we will work with
    setUp(() {
      counterCubit = CounterCubit();
    });

    //common setup
    //teardown-func which will be called after each test run
    tearDown(() {
      counterCubit.close();
    });

    //first test-to check if the intial state of the counter cubit is
    //equal to the counter value of 0

    test('the inital state for the CounterState(counterValue:0)', () {
      expect(counterCubit.state, CounterState(counterValue: 0, wasIncremented: true));

    });
    //INCREMENT
    //this is to test the counter features like increment and decrement
         blocTest('the cubit should emit a CounterState(counterValue:1,wasIncremented:true)when cubit.increment() function is called',
      //is a func that will return the current instance of the counter cubit
      //  in order to be available for the testing
         build:() =>counterCubit,
      //a func that takes cubit and returns the action applied on it
         act: (cubit) =>cubit.increment(),
      //its an iterable list which will verify the order of state and actual
      // admitted state corresponds with the image is wants
         expect:()=> [CounterState(counterValue: 1, wasIncremented: true)],

    );
      //DECREMENT
          blocTest('the cubit should emit a CounterState(counterValue:-1,wasIncremented:false)when cubit.decrement() function is called',
      //is a func that will return the current instance of the counter cubit
      //  in order to be available for the testing
          build:() =>counterCubit,
      //a func that takes cubit and returns the action applied on it
          act: (cubit) =>cubit.decrement(),
      //its an iterable list which will verify the order of state and actual
      // admitted state corresponds with the image is wants
          expect:()=> [CounterState(counterValue: -1, wasIncremented: false)],

    );
  });
}