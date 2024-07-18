import 'package:fltr_test_app/domain/entities/task.dart';
import 'package:fltr_test_app/domain/repositories/tasks_repository.dart';

class TasksRepositoryImpl implements TasksRepository {

  @override
  List<Task> getTasks(int tasksNumber) {
    try {
      List<Task> result = [];
      for (int i = 0; i < tasksNumber; i++) {
        result.add(
          Task(id: i),
        );
      }

      return result;
    } on Exception {
      return List.empty();
    }
  }
}