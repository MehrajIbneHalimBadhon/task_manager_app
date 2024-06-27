import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/widget/task_item.dart';

class InProgressTaskScreen extends StatelessWidget {
  const InProgressTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const TaskItem();
          }),
    );
  }
}
