import 'package:emendo/features/tasks/data/model/task_model.dart';

class Subtaskcounter {
  static int countAllSubTasks(TaskModel task) {
    int count = task.subTasks.length;
    for (var subTask in task.subTasks) {
      count += countAllSubTasks(subTask);
    }
    return count;
  }

  static int countCompletedSubTasks(TaskModel task) {
    int count = 0;
    for (var subTask in task.subTasks) {
      if (subTask.isCompleted == true) count++;
      count += countCompletedSubTasks(subTask);
    }
    return count;
  }
}
