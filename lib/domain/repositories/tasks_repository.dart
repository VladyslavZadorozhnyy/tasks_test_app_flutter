import 'package:fltr_test_app/domain/entities/task.dart';

abstract class TasksRepository {
  List<Task> getTasks(int tasksNumber);
}