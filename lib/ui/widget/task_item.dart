import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 0,
      child: ListTile(
        title: Text('Title will be here'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description will be here'),
            Text(
              'Date: 12/12/24',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label:const Text('New',style: TextStyle(color: Colors.black),),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1,
                        color: Colors.grey
                    ),
                    borderRadius: BorderRadius.circular(16),),
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                  backgroundColor: AppColors.white,
                ),
                ButtonBar(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit_outlined),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete_outlined),),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}