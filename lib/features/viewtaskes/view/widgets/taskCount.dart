import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/thiming/color.dart';
import '../../../add_task/manager/cubit_Addtask.dart';
class TaskCountWidget extends StatelessWidget {
  const TaskCountWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: TaskCubit.get(context).homeRepo.getTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            width: 15.w,
            height: 15.h,
            child: const CircularProgressIndicator(strokeWidth: 2),
          );
        }
        if (snapshot.hasError) {
          return const Icon(Icons.error, color: Colors.red, size: 16);
        }

        final tasks = snapshot.data ?? [];
        return Container(
          width: 18.w,
          height: 18.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: Appcolors.sky,
          ),
          child: Text(
            tasks.length.toString(),
            style: TextStyle(
              color: Appcolors.Scondarycolor,
              fontWeight: FontWeight.bold,
              fontSize: 10.sp,
            ),
          ),
        );
      },
    );
  }
}
