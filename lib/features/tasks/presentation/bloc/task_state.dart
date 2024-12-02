part of 'task_bloc.dart';

@immutable
sealed class TaskState {}

final class TaskStateInitial extends TaskState {}


///I didn't use loading and fail state but i made them for when i need them
class GetTasksLoadingState extends TaskState {}
class GetTasksSuccessState extends TaskState {
  final List<TaskModel> movies;
  GetTasksSuccessState(this.movies);
}
class GetTasksFailedState extends TaskState {
  final String message;
  GetTasksFailedState(this.message);
}


class CreateTaskLoadingState extends TaskState {}
class CreateTaskSuccessState extends TaskState {
  final String message;


  CreateTaskSuccessState({required this.message,});
}
class CreateTaskFailedState extends TaskState {
  final String message;
  CreateTaskFailedState(this.message);
}

class DeleteTaskLoadingState extends TaskState {}
class DeleteTaskSuccessState extends TaskState {
  final String message;
  DeleteTaskSuccessState(this.message);
}
class DeleteTaskFailedState extends TaskState {
  final String name;
  DeleteTaskFailedState(this.name);
}


class EditTaskLoadingState extends TaskState {}
class EditTaskSuccessState extends TaskState {
  final TaskModel task;
  EditTaskSuccessState(this.task);
}
class EditTaskFailedState extends TaskState {
  final String message;
  EditTaskFailedState(this.message);
}

