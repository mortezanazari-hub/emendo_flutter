import 'package:emendo/features/tasks/data/model/task_model.dart';
import 'package:hive/hive.dart';

class TaskProvider {
  String key = 'task_provider';

  late final Box<TaskModel> taskBox;

  List<TaskModel> tasks = [];

  ///init db
  dynamic initDataBase () async {
    try {
      Hive.registerAdapter(TaskModelAdapter());
      taskBox = await Hive.openBox(key);
      return 'success';
    }catch (e) {
      return 'failed';
    }
  }

  ///save
  dynamic createTask (TaskModel task)async{
    int id = 0;
    if(taskBox.values.isEmpty){
      task.id = id;
      await taskBox.put(id, task);
    }

    if(taskBox.isNotEmpty){
      for(var task in taskBox.values){
        task.id = id++;
        await taskBox.put(task.id, task);
      }
    }


  }


  ///delete
  dynamic deleteTask (int id)async{
    // for(var task in tasks){
    //   if(task.id == id){
    //     await taskBox.delete(task.taskName);
    //   }
    // }
    int deleteTaskId = tasks.indexWhere((task) => task.id == id);
    await taskBox.delete(deleteTaskId);
  }

  ///show all tasks
  dynamic getAll ()async{
    await initDataBase();
    tasks = [];
    if(taskBox.isNotEmpty) {
      // int id = 0;
      for(var task in taskBox.values){
        // task.id = id;
        tasks.add(task);
        // task.id = id++;
      }
    }
    return tasks;
   }

  ///edit task
  dynamic editTask (TaskModel taskModel){
    TaskModel userTask = tasks.firstWhere((task) => task.id == taskModel.id);
    tasks[userTask.id] = userTask;
   }
  }

