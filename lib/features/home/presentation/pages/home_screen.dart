import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/widgets/app_link_text.dart';
import 'package:emendo/features/tasks/data/local/test_db_tasks.dart';
import 'package:emendo/features/tasks/data/model/task_model.dart';
import 'package:emendo/features/tasks/presentation/widget/task_view_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _userFullName = "Morteza Nazari";
  late List<TaskModel> sortedTasks;

  void sortTasks() {
    sortedTasks = TestDbTasks.taskList.toList();
    sortedTasks.sort((a, b) => a.compareTo(b));
  }

  @override
  void initState() {
    super.initState();
    sortTasks();
  }

  int countAllSubTasks(TaskModel task) {
    int count = task.subTasks?.length ?? 0;
    task.subTasks?.forEach((subTask) {
      count += countAllSubTasks(subTask);
    });
    return count;
  }

  int countCompletedSubTasks(TaskModel task) {
    int count = 0;
    task.subTasks?.forEach((subTask) {
      if (subTask.isCompleted == true) count++;
      count += countCompletedSubTasks(subTask);
    });
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.indigoColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                /// start header
                Row(
                  children: [
                    //avatar profile
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppConst.disabledColor,
                            width: .5,
                          )),
                      child: CircleAvatar(
                        radius: 20,
                        foregroundImage: AssetImage(
                            "lib/core/resources/png/default_avatar.png"),
                        child: Text(
                          "MN2",
                          style: TextStyle(
                            color: Color(0xff00ff00),
                          ),
                        ),
                      ),
                    ),
                    //space
                    SizedBox(
                      width: 8,
                    ),
                    //Texts column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, $_userFullName",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppConst.secondColor),
                        ), //name
                        const Text(
                          "Lets do your best!",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w300,
                              color: AppConst.secondColor),
                        ), //motto description
                      ],
                    )
                  ],
                ),
                //end of header

                /// start body

                //space
                SizedBox(height: 20),

                //search bar
                TextFormField(
                  onChanged: (value) {
                    //search logic goes here
                  },
                  style: TextStyle(color: AppConst.secondColor),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppConst.disabledColor, width: 1),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppConst.disabledColor, width: 1),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppConst.mainColor, width: 1),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    hintText: "Search your task",
                    hintStyle: TextStyle(color: AppConst.disabledColor),
                    suffixIcon:
                        Icon(Icons.search, color: AppConst.disabledColor),
                  ),
                ),

                //space
                SizedBox(height: 20),

                //Tasks list items
                Row(children: [
                  Text(
                    "Tasks",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppConst.secondColor),
                  ),
                  Spacer(),
                  AppLinkText(text: "see more", onPressed: () {})
                ]),

                //tasks list
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: TestDbTasks.taskList.length,
                  itemBuilder: (context, index) {
                    final task = sortedTasks.elementAt(index);
                    final allTasksLength = countAllSubTasks(task);
                    final completedTasksLength = countCompletedSubTasks(task);
                    return TaskWidget(
                      task,
                      allTasksLength: allTasksLength,
                      completedTasksLength: completedTasksLength,
                    );
                  },
                ),

                //end of body
              ],
            ),
          ),
        ),
      ),
    );
  }
}
