import 'package:emendo/features/tasks/data/model/task_model.dart';

class TestDbTasks {
  static final todayTime =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  static final tomorrowTime = todayTime.add(Duration(days: 1));
  static final tomorrowTime2 = todayTime.add(Duration(days: 2));
  static final yesterdayTime = todayTime.add(Duration(days: -1));
  static final taskList = {
    TaskModel("Task Name 1",
        specificTime: true,
        taskType: TaskType.onDay,
        taskPriority: TaskPriority.low,
        dueDate: todayTime,
        hasNotifications: true,
        notificationType: NotificationType.both,
        repeatedTask: true,
        taskDescription: "$todayTime | low",
        repeatedTaskPeriod: RepeatedTaskPeriod.daily, subTasks: []),
    TaskModel("Task Name 2",
        specificTime: true,
        taskType: TaskType.onDay,
        taskPriority: TaskPriority.low,
        dueDate: yesterdayTime,
        taskDescription:
            "in yek matn tozihat boland hast ke bish az tedade mojaz kalameh dare, karbordesh baraye karbar ine ke ye seri mozakhraf tosh beneviseh",
        hasNotifications: true,
        notificationType: NotificationType.both,
        repeatedTask: true,
        repeatedTaskPeriod: RepeatedTaskPeriod.daily, subTasks: []),
    TaskModel("Task Name 3",
        specificTime: true,
        taskType: TaskType.onDay,
        taskPriority: TaskPriority.medium,
        dueDate: todayTime,
        taskDescription: "$todayTime | medium",
        hasNotifications: false,
        notificationType: NotificationType.both,
        repeatedTask: true,
        repeatedTaskPeriod: RepeatedTaskPeriod.daily,
        subTasks: [
          TaskModel("sub task 1",
              taskDescription:
                  "in yek tozihat hast baraye sub task ha ta ertefa ro test konim", subTasks: []),
          TaskModel("sub task 2", subTasks: []),
          TaskModel("sub task 4", subTasks: [
            TaskModel("sub sub task 1", subTasks: []),
            TaskModel("sub sub task 2", subTasks: []),
            TaskModel("sub sub task 3", subTasks: []),
            TaskModel("sub sub task 4", subTasks: [
              TaskModel("sub sub sub task 1", subTasks: []),
              TaskModel("sub sub sub task 2", subTasks: []),
              TaskModel("sub sub sub task 3", isCompleted: true, subTasks: []),
              TaskModel("sub sub sub task 4", subTasks: [])
            ])
          ])
        ]),
    TaskModel("Task Name 4",
        specificTime: true,
        taskType: TaskType.onDay,
        taskPriority: TaskPriority.high,
        taskDescription: "$tomorrowTime | high",
        dueDate: tomorrowTime, subTasks: []),
    TaskModel(
      "Task Name 5",
      taskPriority: TaskPriority.low, subTasks: [],
    ),
    TaskModel(
      "Task Name 6",
      taskPriority: TaskPriority.medium,
      specificTime: false,
      dueDate: todayTime, subTasks: [],
    ),
    TaskModel(
      "Task Name 7",
      taskPriority: TaskPriority.high, subTasks: [],
    ),
    TaskModel("Task Name 8",
        specificTime: true,
        taskType: TaskType.onDay,
        taskPriority: TaskPriority.medium,
        taskDescription: "$tomorrowTime | medium",
        dueDate: tomorrowTime, subTasks: []),
    TaskModel("Task Name 9",
        specificTime: true,
        taskType: TaskType.onDay,
        taskPriority: TaskPriority.low,
        taskDescription: "$tomorrowTime2 | low",
        dueDate: tomorrowTime2, subTasks: []),
  };
}
