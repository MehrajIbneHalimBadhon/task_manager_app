import 'package:flutter/material.dart';

import '../widget/task_item.dart';

class CompletedTaskScreen extends StatelessWidget {
  const CompletedTaskScreen({super.key});

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
