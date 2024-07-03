import 'package:flutter/material.dart';

class InProgressTaskScreen extends StatelessWidget {
  const InProgressTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return null;
          
            // return const TaskItem();
          }),
    );
  }
}
