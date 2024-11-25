import 'package:emendo/features/tasks/data/model/task_model.dart';

class Subtaskcounter {
  static int countAllSubTasks(TaskModel task) {
    int count = task.subTasks?.length ?? 0;
    task.subTasks?.forEach((subTask) {
      count += countAllSubTasks(subTask);
    });
    return count;
  }

  static int countCompletedSubTasks(TaskModel task) {
    int count = 0;
    task.subTasks?.forEach((subTask) {
      if (subTask.isCompleted == true) count++;
      count += countCompletedSubTasks(subTask);
    });
    return count;
  }
}
