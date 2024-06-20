import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/screen/add_new_task.dart';
import 'package:task_manager_app/ui/utility/app_colors.dart';

import '../widget/task_item.dart';
import '../widget/task_summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onTapAddButton,
        backgroundColor: AppColors.themeColor,
        foregroundColor: AppColors.white,
      ),
      body: Column(
        children: [
          _buildSummarySection(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return TaskItem();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTapAddButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewTaskScreen(),
      ),
    );
  }

  Widget _buildSummarySection() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TaskSummaryCard(
            title: 'New Task',
            count: '34',
          ),
          TaskSummaryCard(
            title: 'Completed',
            count: '34',
          ),
          TaskSummaryCard(
            title: 'In Progress',
            count: '34',
          ),
          TaskSummaryCard(
            title: 'Cancelled',
            count: '34',
          ),
        ],
      ),
    );
  }
}
