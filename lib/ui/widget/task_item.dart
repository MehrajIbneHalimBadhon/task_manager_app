import 'package:flutter/material.dart';
import 'package:task_manager_app/data/model/network_response.dart';
import 'package:task_manager_app/data/model/task_model.dart';
import 'package:task_manager_app/data/network_caller/network_caller.dart';
import 'package:task_manager_app/data/utilities/urls.dart';
import 'package:task_manager_app/ui/widget/center_progress_indicator.dart';
import 'package:task_manager_app/ui/widget/snackbar_message.dart';

import '../utility/app_colors.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({
    super.key,
    required this.taskModel,
    required this.onUpdateTask,
  });

  final TaskModel taskModel;
  final VoidCallback onUpdateTask;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool _deleteInProgress = false;
  final bool _editInProgress = false;
  String dropdownValue = '';
  List<String> statusList = ['New', 'Progress', 'Completed', 'Cancelled'];

  @override
  void initState() {
    dropdownValue = widget.taskModel.status!;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 0,
      child: ListTile(
        title: Text(widget.taskModel.title ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.taskModel.description ?? ''),
            Text(
              'Date: ${widget.taskModel.createdDate}',
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(
                    widget.taskModel.status ?? 'New',
                    style: const TextStyle(color: Colors.black),
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  backgroundColor: AppColors.white,
                ),
                ButtonBar(
                  children: [
                    Visibility(
                      visible: _editInProgress == false,
                      replacement: const CenterProgressIndicator(),
                      child: PopupMenuButton(
                          icon: const Icon(Icons.edit),
                          onSelected: (String selectedValue) {
                            dropdownValue = selectedValue;
                            if (mounted) setState(() {});
                          },
                          itemBuilder: (BuildContext context) {
                            return statusList.map((String value) {
                              return PopupMenuItem(
                                value: value,
                                child: ListTile(
                                  title: Text(value),
                                  trailing: dropdownValue == value
                                      ? const Icon(Icons.done)
                                      : null,
                                ),
                              );
                            }).toList();
                          }),
                    ),
                    Visibility(
                        visible: _deleteInProgress == false,
                        replacement: const CenterProgressIndicator(),
                        child: IconButton(
                          onPressed: () {
                            _deleteTask();
                          },
                          icon: const Icon(Icons.delete_outlined),
                        )),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }



  Future<void> _deleteTask() async {
    _deleteInProgress = true;
    if (mounted) {
      setState(() {});
    }

    NetworkResponse response =
    await NetworkCaller.getRequest(Urls.deleteTask(widget.taskModel.sId!));

    if (response.isSuccess) {
      widget.onUpdateTask();
    } else {
      if (mounted) {
        showSnackbarMessage(
            context,
            response.errorMessage ??
                'Get Task Count by Status Failed! Try Again');
      }
    }

    _deleteInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }
}