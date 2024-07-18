import 'package:fltr_test_app/common/constants.dart';
import 'package:fltr_test_app/domain/entities/task.dart';
import 'package:fltr_test_app/domain/repositories/tasks_repository.dart';

class GetTasksUseCase {
  const GetTasksUseCase({required this.apiRepository});

  final TasksRepository apiRepository;

  List<Task> invoke() {
    return apiRepository.getTasks(defaultTasksNumber);
  }
}