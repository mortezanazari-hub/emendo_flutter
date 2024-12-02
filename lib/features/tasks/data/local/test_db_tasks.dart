import 'package:emendo/features/tasks/data/model/task_model.dart';

class TestDbTasks {
  static final todayTime =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  static final tomorrowTime = todayTime.add(Duration(days: 1));
  static final tomorrowTime2 = todayTime.add(Duration(days: 2));
  static final yesterdayTime = todayTime.add(Duration(days: -1));
  static final taskList = {
    TaskModel(
        1,
        "Task Name 1", [],
        specificTime: true,
        taskType: TaskType.onDay,
        taskPriority: TaskPriority.low,
        dueDate: todayTime,
        hasNotifications: true,
        notificationType: NotificationType.both,
        repeatedTask: true,
        taskDescription: "$todayTime | low",
        repeatedTaskPeriod: RepeatedTaskPeriod.daily),
    TaskModel(
        2,
        "Task Name 2", [],
        specificTime: true,
        taskType: TaskType.onDay,
        taskPriority: TaskPriority.low,
        dueDate: yesterdayTime,
        taskDescription:
            "in yek matn tozihat boland hast ke bish az tedade mojaz kalameh dare, karbordesh baraye karbar ine ke ye seri mozakhraf tosh beneviseh",
        hasNotifications: true,
        notificationType: NotificationType.both,
        repeatedTask: true,
        repeatedTaskPeriod: RepeatedTaskPeriod.daily),
    TaskModel(
      3,
        "Task Name 3",
        specificTime: true,
        taskType: TaskType.onDay,
        taskPriority: TaskPriority.medium,
        dueDate: todayTime,
        taskDescription: "$todayTime | medium",
        hasNotifications: false,
        notificationType: NotificationType.both,
        repeatedTask: true,
        repeatedTaskPeriod: RepeatedTaskPeriod.daily,
        [
          TaskModel(4,"sub task 1", [],
              taskDescription:
                  "in yek tozihat hast baraye sub task ha ta ertefa ro test konim"),
          TaskModel(5,"sub task 2", []),
          TaskModel(6,"sub task 4", [
            TaskModel(7,"sub sub task 1", []),
            TaskModel(8,"sub sub task 2", []),
            TaskModel(9,"sub sub task 3", []),
            TaskModel(10,"sub sub task 4", [
              TaskModel(11,"sub sub sub task 1", []),
              TaskModel(12,"sub sub sub task 2", []),
              TaskModel(13,"sub sub sub task 3", isCompleted: true, []),
              TaskModel(14,"sub sub sub task 4", [])
            ])
          ])
        ]),
    TaskModel(
      15, "Task Name 4",
        specificTime: true,
        taskType: TaskType.onDay,
        taskPriority: TaskPriority.high,
        taskDescription: "$tomorrowTime | high",
        dueDate: tomorrowTime,
        []),
    TaskModel(
      16,
      "Task Name 5",
      taskPriority: TaskPriority.low,
      [],
    ),
    TaskModel(
      17,
      "Task Name 6",
      taskPriority: TaskPriority.medium,
      specificTime: false,
      dueDate: todayTime,
      [],
    ),
    TaskModel(
      18,
      "Task Name 7",
      taskPriority: TaskPriority.high,
      [],
    ),
    TaskModel(19,"Task Name 8", [],
        specificTime: true,
        taskType: TaskType.onDay,
        taskPriority: TaskPriority.medium,
        taskDescription: "$tomorrowTime | medium",
        dueDate: tomorrowTime),
    TaskModel(20,"Task Name 9", [],
        specificTime: true,
        taskType: TaskType.onDay,
        taskPriority: TaskPriority.low,
        taskDescription: "$tomorrowTime2 | low",
        dueDate: tomorrowTime2),
  };
}
