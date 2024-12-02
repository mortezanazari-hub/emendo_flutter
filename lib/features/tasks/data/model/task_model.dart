import 'package:hive/hive.dart';

part 'task_model.g.dart';


@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String taskName;
  @HiveField(2)
  List<TaskModel> subTasks = [];
  @HiveField(3)
  String? taskDescription;
  @HiveField(4)
  TaskPriority taskPriority;
  @HiveField(5)
  bool isCompleted;
  @HiveField(6)
  bool specificTime;
  @HiveField(7)
  TaskType taskType;
  @HiveField(8)
  DateTime? dueDate;
  @HiveField(9)
  DateTime? endEvent;
  @HiveField(10)
  bool hasNotifications;
  @HiveField(11)
  NotificationType notificationType;
  @HiveField(12)
  bool repeatedTask;
  @HiveField(13)
  RepeatedTaskPeriod repeatedTaskPeriod;
  @HiveField(14)
  int? customDayBetween;

  TaskModel(
      this.id,
    this.taskName,
    this.subTasks, {
    this.taskDescription,
    this.taskPriority = TaskPriority.medium,
    this.isCompleted = false,
    this.specificTime = false,
    this.taskType = TaskType.onDay,
    DateTime? dueDate,
    this.endEvent,
    this.hasNotifications = false,
    this.notificationType = NotificationType.push,
    this.repeatedTask = false,
    this.repeatedTaskPeriod = RepeatedTaskPeriod.daily,
    this.customDayBetween = 2,
  }) : dueDate = dueDate ?? DateTime.now();

  DateTime? get effectiveDueDate {
    if (specificTime && dueDate != null) {
      return dueDate;
    }
    return null;
  }

  @override
  // ignore: override_on_non_overriding_member
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

    return taskPriority.value.compareTo(other.taskPriority.value);
  }
}

class TaskPriority {
  final String name;
  final int value;

  const TaskPriority._(this.name, this.value);

  static const low = TaskPriority._('Low', 1);
  static const medium = TaskPriority._('Medium', 2);
  static const high = TaskPriority._('High', 3);

  static List<TaskPriority> get values => [low, medium, high];

  @override
  String toString() => name;
}

class TaskType {
  final String name;
  final int value;

  const TaskType._(this.name, this.value);

  static const onDay = TaskType._('Whole of day', 1);
  static const onHour = TaskType._('On Time', 2);
  static const event = TaskType._('Is a event', 3);

  static List<TaskType> get values => [onDay, onHour, event];

  @override
  String toString() => name;
}

class NotificationType {
  final String name;
  final int value;

  const NotificationType._(this.name, this.value);

  static const email = NotificationType._('Send Email', 1);
  static const push = NotificationType._('Push Notification', 2);
  static const both = NotificationType._('Both', 3);

  static List<NotificationType> get values => [email, push, both];

  @override
  String toString() => name;
}

class RepeatedTaskPeriod {
  final String name;
  final int value;

  const RepeatedTaskPeriod._(this.name, this.value);

  static const daily = RepeatedTaskPeriod._('Daily', 1);
  static const weekly = RepeatedTaskPeriod._('Weekly', 2);
  static const monthly = RepeatedTaskPeriod._('Monthly', 3);
  static const saturdays = RepeatedTaskPeriod._('Saturdays', 4);
  static const sundays = RepeatedTaskPeriod._('Sundays', 5);
  static const mondays = RepeatedTaskPeriod._('Mondays', 6);
  static const tuesdays = RepeatedTaskPeriod._('Tuesdays', 7);
  static const wednesdays = RepeatedTaskPeriod._('Wednesdays', 8);
  static const thursdays = RepeatedTaskPeriod._('Thursdays', 9);
  static const fridays = RepeatedTaskPeriod._('Fridays', 10);
  static const fridaysAndThursdays =
      RepeatedTaskPeriod._('Fridays and Thursdays', 11);
  static const fridaysAndSaturdays =
      RepeatedTaskPeriod._('Fridays and Saturdays', 12);
  static const saturdaysAndSundays =
      RepeatedTaskPeriod._('Saturdays and Sundays', 13);
  static const everyCustomDayBetween =
      RepeatedTaskPeriod._('Custom Day Between', 14);

  static List<RepeatedTaskPeriod> get values => [
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
      ];

  @override
  String toString() => name;
}
