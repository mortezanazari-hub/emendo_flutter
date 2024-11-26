import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/utils/is_today.dart';
import 'package:emendo/features/tasks/data/model/task_model.dart';
import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {
  final TaskModel task;
  final int allTasksLength;
  final int completedTasksLength;
  final double? height;

  const TaskWidget(this.task,
      {required this.allTasksLength,
      required this.completedTasksLength,
      super.key,
      this.height});

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    final task = widget.task;
    final height = widget.height;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: height ?? 75,
          decoration: BoxDecoration(
            color: AppConst.color1,
            border: Border.all(color: AppConst.color2, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 15,
                decoration: BoxDecoration(
                  color: task.taskPriority == TaskPriority.high
                      ? AppConst.color7
                      : task.taskPriority == TaskPriority.medium
                          ? AppConst.color6
                          : AppConst.color4,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //task name and icons
                    Row(
                      children: [
                        //task name
                        Text(
                          task.taskName,
                          style: TextStyle(
                            color: AppConst.color7,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        //calendar icon
                        if (task.specificTime == true &&
                            task.dueDate != null &&
                            IsDay.isToday(task.dueDate!))
                          Text(
                            "Today",
                            style:
                                TextStyle(fontSize: 7, color: AppConst.color5),
                          ),
                        if (task.specificTime == true &&
                            task.dueDate != null &&
                            !IsDay.isToday(task.dueDate!))
                          Text(
                            "${task.dueDate!.day.toString().padLeft(2, '0')}/${task.dueDate!.month.toString().padLeft(2, '0')}",
                            style:
                                TextStyle(fontSize: 7, color: AppConst.color5),
                          ),
                        SizedBox(width: 2),
                        //repeat icon
                        if (task.repeatedTask == true)
                          Icon(
                            Icons.repeat,
                            size: 10,
                            color: AppConst.color5,
                          ),
                        SizedBox(width: 2),
                        //notification icon
                        if (task.hasNotifications == true)
                          Icon(
                            Icons.notifications,
                            size: 10,
                            color: AppConst.color5,
                          ),
                      ],
                    ),

                    //description
                    if (task.taskDescription != null)
                      SizedBox(height: height == null ? 9 : 0),
                    if (task.taskDescription != null)
                      Text(
                        task.taskDescription!,
                        style: TextStyle(
                          color: AppConst.color6,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 45),
                  task.subTasks.isEmpty
                      ? Checkbox(
                          activeColor: AppConst.color4,
                          checkColor: AppConst.color6,
                          // fillColor: WidgetStatePropertyAll(AppConst.color4),
                          focusColor: AppConst.color3,
                          hoverColor: AppConst.color3,
                          shape: CircleBorder(
                            eccentricity: 0.5,
                            //side: BorderSide(color: AppConst.color2, width: 1),
                          ),
                          splashRadius: 20,
                          side: BorderSide(color: AppConst.color4, width: 1),
                          value: task.isCompleted,
                          onChanged: (status) {
                            setState(() {
                              task.isCompleted = status!;
                            });
                          })
                      : Text(
                          "${widget.completedTasksLength}/${widget.allTasksLength}",
                          style: TextStyle(color: AppConst.color7),
                        )
                ],
              ),
              SizedBox(width: 8)
            ],
          ),
        ),
      ),
    );
  }
}
