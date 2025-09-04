import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todooappnit/features/add_task/data/models/Taskmodel.dart';
import 'item_task.dart';

class ItemTaskList extends StatelessWidget {
  const ItemTaskList({super.key, required this.inProgressTasks});
  final List<Taskmodel> inProgressTasks;
  @override
  Widget build(BuildContext context) {
    if (inProgressTasks.isEmpty) {
      return const Center(
        child: Text(
          'No tasks in progress',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      );
    }

    return SizedBox(
      height: 90.h,
      child: ListView.builder(
        itemCount: inProgressTasks.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 22.w),
        itemBuilder: (context, index) {
          return ItemTask(taskes: inProgressTasks[index]);
        },
      ),
    );
  }
}
