import 'package:flutter/material.dart';
import 'package:task_manager_app/data/model/network_response.dart';
import 'package:task_manager_app/data/model/task_by_status_count_wrapper_mode.dart';
import 'package:task_manager_app/data/model/task_list_wrapper.dart';
import 'package:task_manager_app/data/model/task_model.dart';
import 'package:task_manager_app/data/network_caller/network_caller.dart';
import 'package:task_manager_app/data/utilities/urls.dart';
import 'package:task_manager_app/ui/screen/add_new_task.dart';
import 'package:task_manager_app/ui/utility/app_colors.dart';
import 'package:task_manager_app/ui/widget/center_progress_indicator.dart';
import 'package:task_manager_app/ui/widget/snackbar_message.dart';

import '../../data/model/task_count_by_status_model.dart';
import '../widget/task_item.dart';
import '../widget/task_summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key, });

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool _getNewTaskInProgress = false;
  bool _getTaskCountStatusInProgress = false;
  List<TaskModel> newTaskList = [];
  List<TaskCountByStatusModel> taskCountByStatusModel = [];

  @override
  void initState() {
    super.initState();
    _getTaskStatusCount();
    _getNewTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddButton,
        backgroundColor: AppColors.themeColor,
        foregroundColor: AppColors.white,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          _buildSummarySection(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
              child: Visibility(
                visible: _getNewTaskInProgress == false,
                replacement: const CenterProgressIndicator(),
                child: ListView.builder(
                  itemCount: newTaskList.length,
                  itemBuilder: (context, index) {
                    return TaskItem(taskModel: newTaskList[index], onUpdateTask: () {
                      _getNewTask();
                      _getTaskStatusCount();
                    },);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _getTaskStatusCount() async {
    _getTaskCountStatusInProgress = true;
    if (mounted) {
      setState(() {});
    }

    NetworkResponse response = await NetworkCaller.getRequest(Urls.taskStatusCount);

    if (response.isSuccess) {
      TaskCountByStatusWrapperModel taskCountByStatusWrapperModel =
          TaskCountByStatusWrapperModel.fromJson(response.responseDate);
      taskCountByStatusModel =
          taskCountByStatusWrapperModel.taskCountByStatusList ?? [];
    } else {
      if (mounted) {
        showSnackbarMessage(
            context, response.errorMessage ?? 'Get Task Count by Status Failed! Try Again');
      }
    }

    _getTaskCountStatusInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _getNewTask() async {
    _getNewTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }

    NetworkResponse response = await NetworkCaller.getRequest(Urls.newTask);

    if (response.isSuccess) {
      TaskListWrapperModel taskListWrapperModel =
          TaskListWrapperModel.fromJson(response.responseDate);
      newTaskList = taskListWrapperModel.taskList ?? [];
    } else {
      if (mounted) {
        showSnackbarMessage(
            context, response.errorMessage ?? 'Get New Task Failed! Try Again');
      }
    }

    _getNewTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _onTapAddButton() async {
    bool? taskAdded = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNewTaskScreen(),
      ),
    );

    // If a new task was added, refresh the task list
    if (taskAdded == true) {
      _getNewTask();
      _getTaskStatusCount();
    }
  }

  Widget _buildSummarySection() {
    return  Visibility(
      visible: _getTaskCountStatusInProgress == false,
      replacement: const SizedBox(
          height: 100,
          child: CenterProgressIndicator()),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: taskCountByStatusModel.map((e) {
            return TaskSummaryCard(
              title: (e.sId ?? 'Unknown').toUpperCase(),
              count: e.sum.toString(),
            );
          }).toList(),
        ),
      ),
    );
  }
}
