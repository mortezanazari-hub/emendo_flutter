class TaskModel {
  String taskName;
  List<TaskModel> subTasks = [];
  String? taskDescription;
  TaskPriority taskPriority;
  bool isCompleted;
  bool specificTime;
  TaskType taskType;
  DateTime? dueDate;
  DateTime? endEvent;
  bool hasNotifications;
  NotificationType notificationType;
  bool repeatedTask;
  RepeatedTaskPeriod repeatedTaskPeriod;

  TaskModel(
      this.taskName,
      {
        required this.subTasks,
      this.taskDescription,
      this.taskPriority = TaskPriority.medium,
      this.isCompleted = false,
      this.specificTime = false,
      this.taskType = TaskType.onDay,
      this.dueDate,
      this.endEvent,
      this.hasNotifications = false,
      this.notificationType = NotificationType.both,
      this.repeatedTask = false,
      this.repeatedTaskPeriod = RepeatedTaskPeriod.daily,
      });

  DateTime? get effectiveDueDate {
    if (specificTime && dueDate != null) {
      return dueDate;
    }
    return null;
  }

  @override
  int compareTo(TaskModel other) {
    if (specificTime != other.specificTime) {
      return specificTime ? -1 : 1;
    }

    DateTime? thisEffectiveDueDate = effectiveDueDate;
    DateTime? otherEffectiveDueDate = other.effectiveDueDate;

    if (thisEffectiveDueDate != null && otherEffectiveDueDate == null) {
      return -1;
    } else if (thisEffectiveDueDate == null && otherEffectiveDueDate != null) {
      return 1;
    }

    if (thisEffectiveDueDate != null && otherEffectiveDueDate != null) {
      int dateComparison =
          thisEffectiveDueDate.compareTo(otherEffectiveDueDate);
      if (dateComparison != 0) {
        return dateComparison;
      }
    }

    return this.taskPriority.index.compareTo(other.taskPriority.index);
  }
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
