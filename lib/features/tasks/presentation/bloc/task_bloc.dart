import 'package:bloc/bloc.dart';
import 'package:emendo/features/tasks/data/model/task_model.dart';
import 'package:emendo/features/tasks/repository/task_repository.dart';
import 'package:meta/meta.dart';
import '../../../../Common/error_handling/data_state.dart';


part 'task_event.dart';
part 'task_state.dart';

class BookmarkBloc extends Bloc<TaskEvent, TaskState> {
  TaskRepository taskRepository;

  BookmarkBloc(this.taskRepository) : super(TaskStateInitial()) {
    on<TaskEvent>((event, emit) async {

      if(event is GetTasks){
        emit(GetTasksLoadingState());
        DataState dataState = await taskRepository.getTasksRop();

        dataState is DataSuccess
        ? emit(GetTasksSuccessState(dataState.data))
        : emit(GetTasksFailedState(dataState.message!));
      }

      if(event is CreateTask){
        emit(CreateTaskLoadingState());
        DataState dataState = await taskRepository.createTaskRop(event.task);

        dataState is DataSuccess
            ? emit(CreateTaskSuccessState(message: dataState.data ?? 'success',))
            : emit(CreateTaskFailedState(dataState.message!));
      }

      if(event is DeleteTask){
        emit(DeleteTaskLoadingState());
        DataState dataState = await taskRepository.deleteTaskRop(event.id);

        dataState is DataSuccess
            ? emit(DeleteTaskSuccessState(dataState.data ?? 'success'))
            : emit(DeleteTaskFailedState(dataState.message!));
      }

      if(event is EditTask){
        emit(EditTaskLoadingState());
        DataState dataState = await taskRepository.editTask(event.task);

        dataState is DataSuccess
            ? emit(EditTaskSuccessState(dataState.data))
            : emit(EditTaskFailedState(dataState.message!));
      }

     },
    );
  }
}
