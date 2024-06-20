import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/widget/background_widget.dart';
import 'package:task_manager_app/ui/widget/profile_app_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(),
      body: Background(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _titleTEController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    labelText: 'Title',
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _descriptionTEController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    labelText: 'Description',
                  ),
                ),
                SizedBox(height: 16,),
                ElevatedButton(onPressed: (){}, child: Text('Add'))
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _titleTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}