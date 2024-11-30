import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/widgets/container_with_label.dart';
import 'package:emendo/core/widgets/my_style_dropdown_button_form_field.dart';
import 'package:emendo/core/widgets/my_style_text_form_field.dart';
import 'package:emendo/features/tasks/data/local/test_db_tasks.dart';
import 'package:emendo/features/tasks/data/model/task_model.dart';
import 'package:emendo/features/tasks/presentation/widget/sub_tasks.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:emendo/core/widgets/my_style_checkbox.dart';

class TaskEditScreen extends StatefulWidget {
  final TaskModel task;

  TaskEditScreen({super.key, TaskModel? task})
      : task = task ?? TestDbTasks.taskList.elementAt(7);

  @override
  State<TaskEditScreen> createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  late TaskPriority _priority;
  late TaskType _type;
  late RepeatedTaskPeriod _period;
  bool _advancedOptions = true;
  final _dateController = BoardDateTimeController();
  final double optionsRowHeight = 50;

  void _selectDateTime(TaskType type, String mode) async {
    final result = await showBoardDateTimePicker(
      context: context,
      pickerType: type == TaskType.onDay
          ? DateTimePickerType.date
          : DateTimePickerType.datetime,
      initialDate: DateTime.now(),
      minimumDate: mode.contains("end")
          ? widget.task.dueDate
          : DateTime.now().add(const Duration(days: -3650)),
      controller: _dateController,
      options: BoardDateTimeOptions(
        boardTitle: "Select a date",
        languages: BoardPickerLanguages.en(),
        startDayOfWeek: DateTime.monday,
        pickerFormat: PickerFormat.ymd,
      ),
    );
    if (result != null) {
      setState(() {
        mode.contains("start")
            ? widget.task.dueDate = result
            : widget.task.endEvent = result;
      });
    }
  }

  @override
  void initState() {
    _period = widget.task.repeatedTaskPeriod;
    _priority = widget.task.taskPriority;
    _type = widget.task.taskType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final task = widget.task;
    final titleStyle = TextStyle(
        color: AppConst.color6, fontWeight: FontWeight.bold, fontSize: 15);
    final inputBorder = OutlineInputBorder(
        borderSide: BorderSide(color: AppConst.color3, width: 1),
        borderRadius: BorderRadius.circular(20));

    return Scaffold(
      backgroundColor: AppConst.color0,
      appBar: AppBar(
        title: const Text('Edit Task'),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
        backgroundColor: AppConst.color0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              /// Task Name
              MyStyleTextFormField(
                  labelText: "Task Name",
                  hintText: "Task Name",
                  initialValue: task.taskName),

              const SizedBox(height: 10),

              ///Task Description
              MyStyleTextFormField(
                hintText: "Task Description",
                labelText: "Task Description",
                initialValue: task.taskDescription,
                maxLines: 5,
                minLines: 3,
              ),

              const SizedBox(height: 10),

              ///sub Tasks
              ContainerWithLabel(
                label: "Sub Tasks",
                child: SubTasks(task: task),
              ),

              ///Advanced Options
              Row(
                children: [
                  Expanded(child: Container(height: 2, color: AppConst.color2)),
                  TextButton(
                    onPressed: () =>
                        setState(() => _advancedOptions = !_advancedOptions),
                    child: Text(
                      _advancedOptions
                          ? "Hide Advanced Options"
                          : "Show Advanced Options",
                      style: TextStyle(color: AppConst.color5, fontSize: 10),
                    ),
                  )
                ],
              ),

              if (_advancedOptions)
                _buildAdvancedOptions(task, titleStyle, inputBorder)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdvancedOptions(
      TaskModel task, TextStyle titleStyle, OutlineInputBorder inputBorder) {
    return ContainerWithLabel(
      label: "Advanced Options",
      child: Column(
        children: [
          ///Task Priority
          _buildPriorityRow(task, titleStyle, inputBorder),

          ///Task Specific Time
          _buildSpecificTimeRow(task, titleStyle),

          ///Task Type
          if (task.specificTime)
            _buildTimeTypeRow(task, titleStyle, inputBorder),

          ///Task Specific Day
          if (task.specificTime && task.taskType == TaskType.onDay)
            _buildTaskDayRow(task, titleStyle),

          ///Task Specific Time
          if (task.specificTime && task.taskType == TaskType.onHour)
            _buildTaskTimeRow(task, titleStyle),

          ///Task Event
          if (task.specificTime && task.taskType == TaskType.event) ...[
            _buildStartTimeRow(task, titleStyle),
            _buildEndTimeRow(task, titleStyle),
          ],

          ///Task Notification
          if (task.specificTime &&
              (task.taskType == TaskType.event ||
                  task.taskType == TaskType.onHour))
            _buildNotificationRow(task, titleStyle),

          ///Task Repeat
          if (task.specificTime) _buildRepeatRow(task, titleStyle),

          ///Task Repeat Period
          if (task.specificTime && task.repeatedTask)
            _buildPeriodRow(task, titleStyle, inputBorder),

          ///Task Repeat Custom Day
          if (task.specificTime &&
              task.repeatedTask &&
              task.repeatedTaskPeriod ==
                  RepeatedTaskPeriod.everyCustomDayBetween)
            _buildCustomDayRow(task, titleStyle)
        ],
      ),
    );
  }

  Widget _buildPriorityRow(
      TaskModel task, TextStyle titleStyle, OutlineInputBorder inputBorder) {
    return Row(
      children: [
        Text("Priority", style: titleStyle),
        SizedBox(height: optionsRowHeight),
        const Spacer(),
        Expanded(
            child: myStyleDropdownButtonFormField(
                value: _priority,
                onChanged: (newValue) => setState(() {
                      _priority = newValue!;
                      task.taskPriority = newValue;
                    }),
                items: TaskPriority.values)),
      ],
    );
  }

  Widget _buildSpecificTimeRow(TaskModel task, TextStyle titleStyle) {
    return Row(
      children: [
        Text("Specific time", style: titleStyle),
        SizedBox(height: optionsRowHeight),
        const Spacer(),
        myStyleCheckbox(
          value: task.specificTime,
          onChange: (newValue) => setState(() => task.specificTime = newValue!),
        )
      ],
    );
  }

  Widget _buildTimeTypeRow(
      TaskModel task, TextStyle titleStyle, OutlineInputBorder inputBorder) {
    return Row(
      children: [
        Text("Time Type", style: titleStyle),
        SizedBox(height: optionsRowHeight),
        const Spacer(),
        Expanded(
            child: myStyleDropdownButtonFormField(
                value: _type,
                onChanged: (newValue) => setState(() {
                      _type = newValue!;
                      task.taskType = newValue;
                    }),
                items: TaskType.values)),
      ],
    );
  }

  Widget _buildTaskDayRow(TaskModel task, TextStyle titleStyle) {
    return Row(
      children: [
        Text("Task's Day", style: titleStyle),
        const Spacer(),
        SizedBox(height: optionsRowHeight),
        InkWell(
          onTap: () => _selectDateTime(task.taskType, "start"),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppConst.color1,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppConst.color3)),
            child: Text(
              "${DateFormat('EEEE').format(task.dueDate!)} ${task.dueDate!.year}-${task.dueDate!.month}-${task.dueDate!.day}",
              style: titleStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTaskTimeRow(TaskModel task, TextStyle titleStyle) {
    return Row(
      children: [
        Text("Task's Time", style: titleStyle),
        SizedBox(height: optionsRowHeight),
        const Spacer(),
        InkWell(
          onTap: () => _selectDateTime(task.taskType, "start"),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppConst.color1,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppConst.color3)),
            child: Text(
              "${DateFormat('EEEE').format(task.dueDate!)} ${task.dueDate!.year}-${task.dueDate!.month}-${task.dueDate!.day} / ${task.dueDate!.hour}:${task.dueDate!.minute}",
              style: titleStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildStartTimeRow(TaskModel task, TextStyle titleStyle) {
    return Row(
      children: [
        Text("Start Time", style: titleStyle),
        SizedBox(height: optionsRowHeight),
        const Spacer(),
        InkWell(
          onTap: () => _selectDateTime(task.taskType, "start"),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppConst.color1,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppConst.color3)),
            child: Text(
              "${DateFormat('EEEE').format(task.dueDate!)} ${task.dueDate!.year}-${task.dueDate!.month}-${task.dueDate!.day} / ${task.dueDate!.hour}:${task.dueDate!.minute}",
              style: titleStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildEndTimeRow(TaskModel task, TextStyle titleStyle) {
    return Row(
      children: [
        Text("End Time", style: titleStyle),
        SizedBox(height: optionsRowHeight),
        const Spacer(),
        InkWell(
          onTap: () => _selectDateTime(task.taskType, "end"),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppConst.color1,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppConst.color3)),
            child: Text(
              "${DateFormat('EEEE').format(task.endEvent ?? task.dueDate!)} ${task.endEvent == null ? task.dueDate!.year : task.endEvent!.year}-${task.endEvent == null ? task.dueDate!.month : task.endEvent!.month}-${task.endEvent == null ? task.dueDate!.day : task.endEvent!.day} / ${task.endEvent == null ? task.dueDate!.hour : task.endEvent!.hour}:${task.endEvent == null ? task.dueDate!.minute : task.endEvent!.minute}",
              style: titleStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildNotificationRow(TaskModel task, TextStyle titleStyle) {
    return Row(
      children: [
        Text("Notification", style: titleStyle),
        SizedBox(height: optionsRowHeight),
        const Spacer(),
        Checkbox(
          value: task.hasNotifications,
          onChanged: (newValue) =>
              setState(() => task.hasNotifications = newValue!),
          activeColor: AppConst.color4,
        )
      ],
    );
  }

  Widget _buildRepeatRow(TaskModel task, TextStyle titleStyle) {
    return Row(
      children: [
        Text("Repeat", style: titleStyle),
        SizedBox(height: optionsRowHeight),
        const Spacer(),
        myStyleCheckbox(
          value: task.repeatedTask,
          onChange: (newValue) => setState(() => task.repeatedTask = newValue!),
        )
      ],
    );
  }

  Widget _buildPeriodRow(
      TaskModel task, TextStyle titleStyle, OutlineInputBorder inputBorder) {
    return Row(
      children: [
        Text("Period", style: titleStyle),
        SizedBox(height: optionsRowHeight),
        const Spacer(),
        Expanded(
          flex: 2,
          child: myStyleDropdownButtonFormField(
              value: _period,
              onChanged: (newValue) => setState(() {
                    _period = newValue!;
                    task.repeatedTaskPeriod = newValue;
                  }),
              items: RepeatedTaskPeriod.values),
        ),
      ],
    );
  }

  Widget _buildCustomDayRow(TaskModel task, TextStyle titleStyle) {
    return Row(
      children: [
        SizedBox(height: optionsRowHeight + 10),
        Text("Custom Day Between", style: titleStyle),
        const Spacer(),
        Expanded(
          child: MyStyleTextFormField(
            onChanged: (value) => setState(() {
              task.customDayBetween = int.parse(value);
            }),
            initialValue: task.customDayBetween.toString(),
            keyboardType: TextInputType.number,
            showCursor: false,
          ),
        ),
      ],
    );
  }
}
