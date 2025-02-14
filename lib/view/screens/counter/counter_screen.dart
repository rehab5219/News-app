import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../view_model/cubit/counter_cubit/counter_cubit.dart';
import '../../../view_model/utils/app_colors.dart';
import '../second_counter/second_counter_screen.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<CounterCubit>(context).increment();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, int>(builder: (context, state) {
              return Text("$state");
            }),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (asd) => BlocProvider.value(
                      value: BlocProvider.of<CounterCubit>(context),
                      child: SecondCounterScreen(),
                    ),
                  ),
                );
              },
              child: Text("Go to second screen"),
            ),
          ],
        ),
      ),
    );
  }
}
