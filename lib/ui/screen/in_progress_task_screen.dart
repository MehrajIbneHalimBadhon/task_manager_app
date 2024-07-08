import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/widget/profile_app_bar.dart';

class InProgressTaskScreen extends StatelessWidget {
  const InProgressTaskScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return null;
          
            // return const TaskItem();
          }),
    );
  }
}
