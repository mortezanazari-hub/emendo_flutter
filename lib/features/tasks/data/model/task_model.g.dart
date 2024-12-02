// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 1;

  @override
  TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModel(
      fields[0] as int,
      fields[1] as String,
      (fields[2] as List).cast<TaskModel>(),
      taskDescription: fields[3] as String?,
      taskPriority: fields[4] as TaskPriority,
      isCompleted: fields[5] as bool,
      specificTime: fields[6] as bool,
      taskType: fields[7] as TaskType,
      dueDate: fields[8] as DateTime?,
      endEvent: fields[9] as DateTime?,
      hasNotifications: fields[10] as bool,
      notificationType: fields[11] as NotificationType,
      repeatedTask: fields[12] as bool,
      repeatedTaskPeriod: fields[13] as RepeatedTaskPeriod,
      customDayBetween: fields[14] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.taskName)
      ..writeByte(2)
      ..write(obj.subTasks)
      ..writeByte(3)
      ..write(obj.taskDescription)
      ..writeByte(4)
      ..write(obj.taskPriority)
      ..writeByte(5)
      ..write(obj.isCompleted)
      ..writeByte(6)
      ..write(obj.specificTime)
      ..writeByte(7)
      ..write(obj.taskType)
      ..writeByte(8)
      ..write(obj.dueDate)
      ..writeByte(9)
      ..write(obj.endEvent)
      ..writeByte(10)
      ..write(obj.hasNotifications)
      ..writeByte(11)
      ..write(obj.notificationType)
      ..writeByte(12)
      ..write(obj.repeatedTask)
      ..writeByte(13)
      ..write(obj.repeatedTaskPeriod)
      ..writeByte(14)
      ..write(obj.customDayBetween);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
