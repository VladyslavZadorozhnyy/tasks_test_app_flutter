import 'package:fltr_test_app/domain/entities/task.dart';

import 'abs_state.dart';

class TasksState extends AbsState {
  TasksState({
    required Status status,
    required List<Task> data,
    required String errorMessage,
  }) : super(
    status: status,
    data: data,
    errorMessage: errorMessage,
  );
}