import 'package:emendo/features/tasks/data/model/task_model.dart';
import '../../../Common/error_handling/check_exceptions.dart';
import '../../../Common/error_handling/data_state.dart';
import '../data/local/task_provider.dart';

class TaskRepository {
  TaskProvider taskProvider;

  TaskRepository(this.taskProvider);


  Future <DataState<dynamic>> createTaskRop (TaskModel task) async {
    try{
      await taskProvider.createTask(task);
      return const DataSuccess('success');
    } catch (e){
      return CheckExceptions.getError(e);
    }
  }

  Future <DataState<dynamic>> deleteTaskRop (int id) async {
    try{
      await taskProvider.deleteTask(id);
      return const DataSuccess('success');
    }catch (e){
      return CheckExceptions.getError(e);
    }
  }

  Future <DataState<dynamic>> getTasksRop () async {
    try{
      var response = await taskProvider.getAll();
      return DataSuccess(response);
    }catch (e){
      return CheckExceptions.getError(e);
    }
  }

  Future <DataState<dynamic>> editTask (TaskModel task) async {
    try{
      var response = await taskProvider.editTask(task);
      return DataSuccess(response);
    }catch (e){
      return CheckExceptions.getError(e);
    }
  }
}