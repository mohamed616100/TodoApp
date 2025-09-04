import 'package:flutter/material.dart';
import 'package:todooappnit/features/viewtaskes/view/widgets/viewTask_Item.dart';

import '../../../add_task/data/models/Taskmodel.dart';
import '../../../add_task/manager/cubit_Addtask.dart';
import '../../../home/view/widget/home_screen_empty/home_screen_empty.dart';

class ViewtaskList extends StatelessWidget {
  const ViewtaskList({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Taskmodel>>(
      stream: TaskCubit.get(context).homeRepo.getTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Error loading tasks"));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const HomeScreenEmpty();
        }

        final tasks = snapshot.data!;
        return ListView.separated(
          itemCount: tasks.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return ViewtaskItem(taskmodel: tasks[index]);
          },
        );
      },
    );
  }
}
