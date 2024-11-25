import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/utils/subTaskCounter.dart';
import 'package:emendo/core/widgets/line_with_icon_clip_path.dart';
import 'package:emendo/core/widgets/my_style_text_form_field.dart';
import 'package:emendo/features/tasks/data/model/task_model.dart';
import 'package:emendo/features/tasks/presentation/widget/task_view_model.dart';
import 'package:flutter/material.dart';

import '../../data/local/test_db_tasks.dart';

class TaskEditScreen extends StatefulWidget {
  late final TaskModel task;

  TaskEditScreen({super.key}) {
    task = TestDbTasks.taskList.toList()[2];
  }

  @override
  State<TaskEditScreen> createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  @override
  Widget build(BuildContext context) {
    final task = widget.task;
    return Scaffold(
      backgroundColor: AppConst.color0,
      appBar: AppBar(
        title: const Text('Edit Task'),
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              MyStyleTextFormField(
                  labelText: "Task Name",
                  hintText: "Task Name",
                  initialValue: task.taskName),
              SizedBox(
                height: 10,
              ),
              MyStyleTextFormField(
                hintText: "If your task has a description, you can write here",
                labelText: "Task Description",
                initialValue: task.taskDescription,
                maxLines: 5,
                minLines: 3,
              ),
              SizedBox(
                height: 10,
              ),
              ContainerWithLabel(task: task)
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerWithLabel extends StatelessWidget {
  const ContainerWithLabel({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: AppConst.color2),
              borderRadius: BorderRadius.circular(20)),
          child: SubTasks(task: task),
        ),
        Positioned(
          top: -8,
          left: 5,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            color: AppConst.color0,
            child: Text(
              "Sub Tasks",
              style: TextStyle(
                color: AppConst.color5,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SubTasks extends StatelessWidget {
  const SubTasks({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (task.subTasks.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: task.subTasks.length,
            itemBuilder: (context, index) {
              final subTask = task.subTasks.elementAt(index);
              final allTasksLength = Subtaskcounter.countAllSubTasks(subTask);
              final completedTasksLength =
                  Subtaskcounter.countCompletedSubTasks(subTask);
              return TaskWidget(
                subTask,
                allTasksLength: allTasksLength,
                completedTasksLength: completedTasksLength,
              );
            },
          ),
        SizedBox(height: 10),
        LineWithIcon(
          onTap: () {},
        ),
      ],
    );
  }
}
