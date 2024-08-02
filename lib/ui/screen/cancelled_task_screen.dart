import 'package:flutter/material.dart';
import 'package:task_manager_app/data/model/network_response.dart';
import 'package:task_manager_app/data/model/task_list_wrapper.dart';
import 'package:task_manager_app/data/model/task_model.dart';
import 'package:task_manager_app/data/network_caller/network_caller.dart';
import 'package:task_manager_app/data/utilities/urls.dart';
import 'package:task_manager_app/ui/widget/center_progress_indicator.dart';
import 'package:task_manager_app/ui/widget/snackbar_message.dart';
import 'package:task_manager_app/ui/widget/task_item.dart';


class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key,});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  bool _getTaskCancel = false;
  List<TaskModel> _taskList=[];
  @override
  void initState() {
    _getCancelTask();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: _getTaskCancel == false,
        replacement: const CenterProgressIndicator(),
        child: ListView.builder(
            itemCount: _taskList.length,
            itemBuilder: (context, index) {
              return TaskItem(taskModel: _taskList[index], onUpdateTask: _getCancelTask);

              // return const TaskItem();
            }),
      ),
    );
  }

  Future<void> _getCancelTask() async {
    _getTaskCancel = true;
    if (mounted) {
      setState(() {});
    }

    NetworkResponse response = await NetworkCaller.getRequest(Urls.cancelledTasks);

    if (response.isSuccess) {
      TaskListWrapperModel taskListWrapperModel =
      TaskListWrapperModel.fromJson(response.responseDate);
      _taskList = taskListWrapperModel.taskList ?? [];
    } else {
      if (mounted) {
        showSnackbarMessage(
            context, response.errorMessage ?? 'Get Progress Task Failed! Try Again');
      }
    }

    _getTaskCancel = false;
    if (mounted) {
      setState(() {});
    }
  }
}
