import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/utils/filter_search.dart';
import 'package:emendo/core/utils/subTaskCounter.dart';
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

  FilterSearch _selectedFilter = FilterSearch.all;

  void sortTasks() {
    sortedTasks = TestDbTasks.taskList.toList();
    sortedTasks.sort((a, b) => a.compareTo(b));
  }

  void _onFilterSelected(FilterSearch filter) {
    setState(() {
      _selectedFilter = filter;
    });
    // Apply the filter to your task list here
  }

  @override
  void initState() {
    super.initState();
    sortTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
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
                            color: AppConst.color3,
                            width: .5,
                          )),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: AppConst.color2,
                        foregroundImage: AssetImage(
                            "lib/core/resources/png/default_avatar.png"),
                        child: SizedBox(),
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
                              color: AppConst.color7),
                        ), //name
                        const Text(
                          "Lets do your best!",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w300,
                              color: AppConst.color6),
                        ), //motto description
                      ],
                    )
                  ],
                ),
                //end of header

                /// start body

                //space
                SizedBox(height: 10),

                //search bar
                SizedBox(
                  height: 45,
                  child: TextFormField(
                    onChanged: (value) {
                      //search logic goes here
                    },
                    style: TextStyle(color: AppConst.color6),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppConst.color2, width: 1),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppConst.color2, width: 1),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppConst.color4, width: 1),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: "Search your task",
                      hintStyle: TextStyle(
                        color: AppConst.color5,
                        fontSize: 14,
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: AppConst.color5,
                        size: 18,
                      ),
                    ),
                  ),
                ),

                //space
                SizedBox(height: 10),

                //Tasks list items
                Row(children: [
                  SizedBox(width: 10),
                  Text(
                    "Tasks",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppConst.color7,
                        fontSize: 16),
                  ),
                  Spacer(),
                  //AppLinkText(text: "see more", onPressed: () {})
                ]),
                SizedBox(height: 5),
                FilterButton(
                  initialFilter: _selectedFilter,
                  onFilterSelected: _onFilterSelected,
                ),
                SizedBox(height: 5),

                //tasks list
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: TestDbTasks.taskList.length,
                  itemBuilder: (context, index) {
                    final task = sortedTasks.elementAt(index);
                    final allTasksLength =
                        SubtaskCounter.countAllSubTasks(task);
                    final completedTasksLength =
                        SubtaskCounter.countCompletedSubTasks(task);
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
