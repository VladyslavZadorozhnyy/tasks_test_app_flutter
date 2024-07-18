import 'package:fltr_test_app/common/constants.dart';
import 'package:fltr_test_app/presentation/qubits/tasks_qubit.dart';
import 'package:fltr_test_app/presentation/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const TasksApp());
}

class TasksApp extends StatelessWidget {
  const TasksApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<TasksCubit>(
          create: (BuildContext context) => TasksCubit(),
        ),
      ],
      child: MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: primaryColor,
          appBarTheme: const AppBarTheme(color: primaryColor),
        ),
          home: Scaffold(
              appBar: AppBar(
                title: const Text(appName),
              ),
              body: const HomeScreen()
            ),
        ),
    );
  }
}