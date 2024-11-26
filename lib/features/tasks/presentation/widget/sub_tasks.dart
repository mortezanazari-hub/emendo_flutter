import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/utils/subTaskCounter.dart';
import 'package:emendo/core/widgets/line_with_icon_clip_path.dart';
import 'package:emendo/core/widgets/my_style_text_form_field.dart';
import 'package:emendo/features/tasks/data/model/task_model.dart';
import 'package:emendo/features/tasks/presentation/widget/task_view_model.dart';
import 'package:flutter/material.dart';

class SubTasks extends StatefulWidget {
  const SubTasks({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  State<SubTasks> createState() => _SubTasksState();
}

class _SubTasksState extends State<SubTasks> {
  late bool _addTaskShow;
  late TextEditingController _addTaskController;

  @override
  void initState() {
    _addTaskShow = false;
    _addTaskController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.task.subTasks.isEmpty)
          Text(
            "There are no subtasks here. You can create one.",
            style: TextStyle(
              color: AppConst.color6,
              fontSize: 14,
            ),
          ),
        if (widget.task.subTasks.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.task.subTasks.length,
            itemBuilder: (context, index) {
              final subTask = widget.task.subTasks.elementAt(index);
              final allTasksLength = Subtaskcounter.countAllSubTasks(subTask);
              final completedTasksLength =
                  Subtaskcounter.countCompletedSubTasks(subTask);
              return TaskWidget(
                height: 50,
                subTask,
                allTasksLength: allTasksLength,
                completedTasksLength: completedTasksLength,
              );
            },
          ),
        if (_addTaskShow) SizedBox(height: 10),
        if (_addTaskShow)
          MyStyleTextFormField(
            hintText: "add task",
            controller: _addTaskController,
            onFieldSubmitted: (text) {
              if (_addTaskController.text.isEmpty) return;
              setState(() {
                _addTaskShow = false;
                widget.task.subTasks.add(TaskModel(_addTaskController.text));
                _addTaskController.clear();
              });
            },
          ),
        SizedBox(height: 10),
        LineWithIcon(
          icon: !_addTaskShow ? Icons.add : Icons.close,
          onTap: () {
            setState(() {
              _addTaskShow = !_addTaskShow;
            });
          },
        ),
      ],
    );
  }
}
