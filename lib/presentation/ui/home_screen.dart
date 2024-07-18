import 'package:fltr_test_app/common/constants.dart';
import 'package:fltr_test_app/presentation/qubits/tasks_qubit.dart';
import 'package:fltr_test_app/presentation/qubits/states/abs_state.dart';
import 'package:fltr_test_app/presentation/qubits/states/tasks_state.dart';
import 'package:fltr_test_app/presentation/ui/abs_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends AbsPageScreen {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
            context.read<TasksCubit>().requestTasks();
            return buildLoadingScreen(context);
          case Status.loading:
            return buildLoadingScreen(context);
          case Status.failed:
            return _buildSuccessScreen(context, state, state.errorMessage);
          case Status.success:
            return _buildSuccessScreen(context, state, successFetchMessage);
          default:
            String message = "Push button to receive data";
            return _buildSuccessScreen(context, state, message);
        }
      },
    );
  }

  Widget _buildSuccessScreen(BuildContext context, TasksState state, String message) {
    Size screenSize = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: screenSize.width,
          height: screenSize.height * 0.65,
          color: Colors.yellow,
          child: Center(
              child: Text(
                message,
                style: defaultTextStyle,
            ),
          ),
        ),
        const SizedBox(
          width: double.infinity,
          height: 10,
        ),
        MaterialButton(
          color: Colors.teal,
          height: 60,
          minWidth: 200,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          onPressed: () async { await context.read<TasksCubit>().requestTasks(); },
          child: Text(
            'Retrieve tasks',
            style: defaultTextStyle,
          ),
        ),
      ],
    );
  }
}