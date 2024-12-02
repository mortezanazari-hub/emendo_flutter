part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

class CreateTask extends TaskEvent {
  final TaskModel task;
  CreateTask ({required this.task});
}

class DeleteTask extends TaskEvent {
  final int id;

  DeleteTask({required this.id});
}

class GetTasks extends TaskEvent {}


class EditTask extends TaskEvent{
  final TaskModel task;

  EditTask({required this.task});
}