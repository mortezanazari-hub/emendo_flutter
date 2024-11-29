import 'dart:ffi';

import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/widgets/container_with_label.dart';
import 'package:emendo/core/widgets/my_style_text_form_field.dart';
import 'package:emendo/features/tasks/data/model/task_model.dart';
import 'package:emendo/features/tasks/presentation/widget/sub_tasks.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:emendo/features/tasks/data/local/test_db_tasks.dart';

class TaskEditScreen extends StatefulWidget {
  late final TaskModel task;

  TaskEditScreen({super.key}) {
    task = TestDbTasks.taskList.toList()[7];
  }

  @override
  State<TaskEditScreen> createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  late bool _showAdvancedOptions;
  late TaskPriority _selectedPriority;
  late TaskType _selectedType;
  late RepeatedTaskPeriod _selectedPeriod;
  final dateController = BoardDateTimeController();

  void _choseDay(TaskType isType, String de) async {
    DateTime selectedDateTime = DateTime.now();
    final result = await showBoardDateTimePicker(
      context: context,
      pickerType: isType == TaskType.onDay
          ? DateTimePickerType.date
          : DateTimePickerType.datetime,
      initialDate: selectedDateTime,
      minimumDate: de.contains("end")
          ? widget.task.dueDate
          : DateTime.now().add(Duration(days: -3650)),
      controller: dateController,
      options: BoardDateTimeOptions(
        boardTitle: "Select a date",
        languages: BoardPickerLanguages.en(),
        startDayOfWeek: DateTime.monday,
        pickerFormat: PickerFormat.ymd,
        calendarSelectionRadius: 20,
      ),
    );
    if (result != null) {
      setState(() {
        selectedDateTime = result;
        if (de.contains("start")) {
          widget.task.dueDate = selectedDateTime;
        } else {
          widget.task.endEvent = selectedDateTime;
        }
      });
    }
  }

  @override
  void initState() {
    _selectedPeriod = widget.task.repeatedTaskPeriod;
    _showAdvancedOptions = true;
    _selectedPriority = widget.task.taskPriority;
    _selectedType = widget.task.taskType;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final task = widget.task;
    final TextStyle advancedOptionsTitle = TextStyle(
        color: AppConst.color6, fontWeight: FontWeight.bold, fontSize: 15);
    final inputBorder = OutlineInputBorder(
        borderSide: BorderSide(
          color: AppConst.color3,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20));
    return Scaffold(
      backgroundColor: AppConst.color0,
      appBar: AppBar(
        title: const Text('Edit Task'),
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
        backgroundColor: AppConst.color0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              MyStyleTextFormField(
                  cursorColor: AppConst.color4,
                  labelText: "Task Name",
                  hintText: "Task Name",
                  initialValue: task.taskName),
              SizedBox(
                height: 10,
              ),
              MyStyleTextFormField(
                cursorColor: AppConst.color4,
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
                      ///Priority
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
                                  border: inputBorder,
                                  contentPadding: EdgeInsets.only(left: 10),
                                  focusColor: AppConst.color6,
                                  hoverColor: AppConst.color2,
                                  fillColor: AppConst.color1,
                                  filled: true,
                                  focusedBorder: inputBorder,
                                  enabledBorder: inputBorder),
                              style: TextStyle(
                                color: AppConst.color6,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              onChanged: (TaskPriority? newValue) {
                                setState(() {
                                  _selectedPriority = newValue!;
                                  widget.task.taskPriority = newValue;
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

                      ///specific Time
                      Row(
                        children: [
                          Text(
                            "Specific time",
                            style: advancedOptionsTitle,
                          ),
                          Spacer(),
                          Checkbox(
                              activeColor: AppConst.color4,
                              checkColor: AppConst.color6,
                              focusColor: AppConst.color3,
                              hoverColor: AppConst.color3,
                              splashRadius: 20,
                              side:
                                  BorderSide(color: AppConst.color4, width: 1),
                              value: task.specificTime,
                              onChanged: (newValue) {
                                setState(() {
                                  task.specificTime = newValue!;
                                });
                              })
                        ],
                      ),

                      ///Task Type
                      if (task.specificTime)
                        Row(
                          children: [
                            Text(
                              "ُTime Type",
                              style: advancedOptionsTitle,
                            ),
                            Spacer(),
                            Expanded(
                              child: DropdownButtonFormField<TaskType>(
                                value: _selectedType,
                                focusColor: AppConst.color2,
                                dropdownColor: AppConst.color2,
                                alignment: Alignment.center,
                                decoration: InputDecoration(
                                    border: inputBorder,
                                    contentPadding: EdgeInsets.only(left: 10),
                                    focusColor: AppConst.color6,
                                    hoverColor: AppConst.color2,
                                    fillColor: AppConst.color1,
                                    filled: true,
                                    focusedBorder: inputBorder,
                                    enabledBorder: inputBorder),
                                style: TextStyle(
                                  color: AppConst.color6,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                onChanged: (TaskType? newValue) {
                                  setState(() {
                                    _selectedType = newValue!;
                                    widget.task.taskType = newValue;
                                  });
                                },
                                items: TaskType.values.map((TaskType value) {
                                  return DropdownMenuItem<TaskType>(
                                    value: value,
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      SizedBox(
                        height: 10,
                      ),

                      ///whole of Day
                      if (task.specificTime && task.taskType == TaskType.onDay)
                        Row(
                          children: [
                            Text(
                              "Task's Day",
                              style: advancedOptionsTitle,
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                _choseDay(task.taskType, "start");
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: AppConst.color1,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: AppConst.color3)),
                                child: Text(
                                    style: advancedOptionsTitle,
                                    "${DateFormat('EEEE').format(task.dueDate!)}"
                                    " ${task.dueDate!.year}"
                                    "-${task.dueDate!.month}"
                                    "-${task.dueDate!.day}"),
                              ),
                            )
                          ],
                        ),

                      ///time of day
                      if (task.specificTime && task.taskType == TaskType.onHour)
                        Row(
                          children: [
                            Text(
                              "Task's Time",
                              style: advancedOptionsTitle,
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                _choseDay(task.taskType, "start");
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: AppConst.color1,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: AppConst.color3)),
                                child: Text(
                                    style: advancedOptionsTitle,
                                    "${DateFormat('EEEE').format(task.dueDate!)} ${task.dueDate!.year}"
                                    "-${task.dueDate!.month}"
                                    "-${task.dueDate!.day} "
                                    "/ ${task.dueDate!.hour}"
                                    ":${task.dueDate!.minute}"),
                              ),
                            )
                          ],
                        ),

                      ///event
                      if (task.specificTime && task.taskType == TaskType.event)
                        Row(
                          children: [
                            Text(
                              "Start Time",
                              style: advancedOptionsTitle,
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                _choseDay(task.taskType, "start");
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: AppConst.color1,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: AppConst.color3)),
                                child: Text(
                                    style: advancedOptionsTitle,
                                    "${DateFormat('EEEE').format(task.dueDate!)}"
                                    " ${task.dueDate!.year}"
                                    "-${task.dueDate!.month}"
                                    "-${task.dueDate!.day}"
                                    " / ${task.dueDate!.hour}"
                                    ":${task.dueDate!.minute}"),
                              ),
                            )
                          ],
                        ),
                      if (task.specificTime && task.taskType == TaskType.event)
                        SizedBox(height: 10),
                      if (task.specificTime &&
                          task.taskType == TaskType.event &&
                          task.dueDate != null)
                        Row(
                          children: [
                            Text(
                              "End Time",
                              style: advancedOptionsTitle,
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                _choseDay(task.taskType, "end");
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: AppConst.color1,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: AppConst.color3)),
                                child: Text(
                                    style: advancedOptionsTitle,
                                    "${DateFormat('EEEE').format(task.endEvent ?? task.dueDate!)} "
                                    "${task.endEvent == null ? task.dueDate!.year : task.endEvent!.year} "
                                    "-${task.endEvent == null ? task.dueDate!.month : task.endEvent!.month}"
                                    "-${task.endEvent == null ? task.dueDate!.day : task.endEvent!.day}"
                                    " / ${task.endEvent == null ? task.dueDate!.hour : task.endEvent!.hour}"
                                    ":${task.endEvent == null ? task.dueDate!.minute : task.endEvent!.minute}"),
                              ),
                            )
                          ],
                        ),

                      if (task.specificTime &&
                          (task.taskType == TaskType.event ||
                              task.taskType == TaskType.onHour))

                        ///Has notification
                        Row(
                          children: [
                            Text(
                              "Notification",
                              style: advancedOptionsTitle,
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: AppConst.color4,
                                checkColor: AppConst.color6,
                                focusColor: AppConst.color3,
                                hoverColor: AppConst.color3,
                                splashRadius: 20,
                                side: BorderSide(
                                    color: AppConst.color4, width: 1),
                                value: task.hasNotifications,
                                onChanged: (newValue) {
                                  setState(() {
                                    task.hasNotifications = newValue!;
                                  });
                                })
                          ],
                        ),
                      if (task.specificTime)

                        ///Repeat
                        Row(
                          children: [
                            Text(
                              "Repeat",
                              style: advancedOptionsTitle,
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: AppConst.color4,
                                checkColor: AppConst.color6,
                                focusColor: AppConst.color3,
                                hoverColor: AppConst.color3,
                                splashRadius: 20,
                                side: BorderSide(
                                    color: AppConst.color4, width: 1),
                                value: task.repeatedTask,
                                onChanged: (newValue) {
                                  setState(() {
                                    task.repeatedTask = newValue!;
                                  });
                                })
                          ],
                        ),

                      ///Repeat Type
                      if (task.specificTime && task.repeatedTask)
                        Row(
                          children: [
                            Text(
                              "Period",
                              style: advancedOptionsTitle,
                            ),
                            Spacer(),
                            // SizedBox(width: 10),
                            Expanded(
                              flex: 2,
                              child:
                                  DropdownButtonFormField<RepeatedTaskPeriod>(
                                value: _selectedPeriod,
                                focusColor: AppConst.color2,
                                dropdownColor: AppConst.color2,
                                decoration: InputDecoration(
                                    border: inputBorder,
                                    contentPadding: EdgeInsets.only(left: 10),
                                    focusColor: AppConst.color6,
                                    hoverColor: AppConst.color2,
                                    fillColor: AppConst.color1,
                                    filled: true,
                                    focusedBorder: inputBorder,
                                    enabledBorder: inputBorder),
                                style: TextStyle(
                                  color: AppConst.color6,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                onChanged: (RepeatedTaskPeriod? newValue) {
                                  setState(() {
                                    _selectedPeriod = newValue!;
                                    widget.task.repeatedTaskPeriod = newValue;
                                  });
                                },
                                items: RepeatedTaskPeriod.values
                                    .map((RepeatedTaskPeriod value) {
                                  return DropdownMenuItem<RepeatedTaskPeriod>(
                                    value: value,
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),

                      ///Repeat Type
                      if (task.specificTime &&
                          task.repeatedTask &&
                          task.repeatedTaskPeriod ==
                              RepeatedTaskPeriod.everyCustomDayBetween)
                        Row(
                          children: [
                            SizedBox(height: 72),
                            Text(
                              "Custom Day Between",
                              style: advancedOptionsTitle,
                            ),
                            SizedBox(
                              width: 75,
                            ),
                            Spacer(),
                            // SizedBox(width: 10),
                            Expanded(
                              child: MyStyleTextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    widget.task.customDayBetween = value as int;
                                  });
                                },
                                initialValue: task.customDayBetween.toString(),
                                keyboardType: TextInputType.number,
                                showCursor: false,
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
