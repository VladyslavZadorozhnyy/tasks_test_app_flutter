import 'package:fltr_test_app/domain/entities/task.dart';

import 'abs_state.dart';

class TasksState extends AbsState<List<Task>> {
  TasksState({
    required final Status status,
    required final List<Task> data,
    required final String errorMessage,
  }) : super(
    status: status,
    data: data,
    errorMessage: errorMessage,
  );
}