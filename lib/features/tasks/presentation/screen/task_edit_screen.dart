import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/utils/subTaskCounter.dart';
import 'package:emendo/core/widgets/container_with_label.dart';
import 'package:emendo/core/widgets/line_with_icon_clip_path.dart';
import 'package:emendo/core/widgets/my_style_text_form_field.dart';
import 'package:emendo/features/tasks/data/model/task_model.dart';
import 'package:emendo/features/tasks/presentation/widget/sub_tasks.dart';
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
  late bool _showAdvancedOptions;
  late TaskPriority _selectedPriority;

  @override
  void initState() {
    _showAdvancedOptions = true;
    _selectedPriority = TaskPriority.medium;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final task = widget.task;
    final TextStyle advancedOptionsTitle = TextStyle(
        color: AppConst.color6, fontWeight: FontWeight.bold, fontSize: 15);
    final underLineInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(
      color: AppConst.color5,
      width: 2,
    ));
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

              ContainerWithLabel(
                label: "Sub Tasks",
                child: SubTasks(task: task),
              ),
              // SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 2,
                    color: AppConst.color2,
                  )),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _showAdvancedOptions = !_showAdvancedOptions;
                      });
                    },
                    child: Text(
                      _showAdvancedOptions
                          ? "Hide Advanced Options"
                          : "Show Advanced Options",
                      style: TextStyle(
                        color: AppConst.color5,
                        fontSize: 10,
                      ),
                    ),
                  )
                ],
              ),
              if (_showAdvancedOptions) SizedBox(height: 10),
              if (_showAdvancedOptions)
                ContainerWithLabel(
                  label: "Advanced Options",
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Priority",
                            style: advancedOptionsTitle,
                          ),
                          Spacer(),
                          Expanded(
                            child: DropdownButtonFormField<TaskPriority>(
                              value: _selectedPriority,
                              focusColor: AppConst.color2,
                              dropdownColor: AppConst.color2,
                              alignment: Alignment.center,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppConst.color7,
                                        width: 4,
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                  contentPadding: EdgeInsets.only(left: 10),
                                  focusColor: AppConst.color7,
                                  hoverColor: AppConst.color2,
                                  fillColor: AppConst.color1,
                                  filled: true,
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none)),
                              style: TextStyle(
                                color: AppConst.color6,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              onChanged: (TaskPriority? newValue) {
                                setState(() {
                                  _selectedPriority = newValue!;
                                });
                              },
                              items:
                                  TaskPriority.values.map((TaskPriority value) {
                                return DropdownMenuItem<TaskPriority>(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
