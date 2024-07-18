import 'package:fltr_test_app/common/constants.dart';
import 'package:fltr_test_app/data/repositories/tasks_repository_impl.dart';
import 'package:fltr_test_app/domain/entities/task.dart';
import 'package:fltr_test_app/domain/usecases/get_tasks_use_case.dart';
import 'package:fltr_test_app/presentation/qubits/states/abs_state.dart';
import 'package:fltr_test_app/presentation/qubits/states/tasks_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(
    TasksState(
        status: Status.initial,
        data: List.empty(),
        errorMessage: "",
    ),
  );

  final GetTasksUseCase getTasksUseCase = GetTasksUseCase(
      apiRepository: TasksRepositoryImpl(),
  );

  Future<void> requestTasks() async {
    emit(
      TasksState(
          status: Status.loading,
          data: List.empty(),
          errorMessage: "",
      ),
    );

    List<Task> tasks = getTasksUseCase.invoke();
    if (tasks.isEmpty) {
      emit(
        TasksState(
          status: Status.failed,
          data: List.empty(),
          errorMessage: tasksFetchingError,
        ),
      );
    } else {
      emit(
          TasksState(
              status: Status.success,
              data: tasks,
              errorMessage: ""
          )
      );
    }
  }
}