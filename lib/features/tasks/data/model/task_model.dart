class TaskModel {
  late String taskName;
  List<TaskModel>? subTasks;
  String? taskDescription;
  TaskPriority? taskPriority;
  bool? isCompleted;
  bool? specificTime;
  TaskType? taskType;
  DateTime? specificDateTime;
  DateTime? dueDate;
  DateTime? startEvent;
  DateTime? endEvent;
  bool? hasNotifications;
  NotificationType? notificationType;
  bool? repeatedTask;
  RepeatedTaskPeriod? repeatedTaskPeriod;
}

enum TaskPriority { high, medium, low }

enum TaskType { onDay, onHour, event }

enum NotificationType { email, push, both }

enum RepeatedTaskPeriod {
  daily,
  weekly,
  monthly,
  saturdays,
  sundays,
  mondays,
  tuesdays,
  wednesdays,
  thursdays,
  fridays,
  fridaysAndThursdays,
  fridaysAndSaturdays,
  saturdaysAndSundays,
  everyCustomDayBetween
}
