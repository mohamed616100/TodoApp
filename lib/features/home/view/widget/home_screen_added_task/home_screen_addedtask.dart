import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todooappnit/core/thiming/color.dart';
import 'package:todooappnit/core/thiming/styles.dart';
import 'package:todooappnit/features/add_task/data/models/Taskmodel.dart';
import 'package:todooappnit/features/home/view/widget/home_screen_added_task/item_task_list.dart';
import 'package:todooappnit/features/home/view/widget/home_screen_added_task/progress_task.dart';
import 'package:todooappnit/features/home/view/widget/home_screen_added_task/numberoftask.dart';
import 'package:todooappnit/features/home/view/widget/home_screen_added_task/task_groub.dart';
import '../../../../../rescorce/asset_icons.dart';
import '../../../../add_task/manager/cubit_Addtask.dart';
class HomeScreenAddedtask extends StatelessWidget {
  const HomeScreenAddedtask({super.key, });
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Taskmodel>>(
      stream:TaskCubit.get(context).homeRepo.getTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final TasksinHome = snapshot.data!.where((test)=>test.group=="Work")
        .toList();

        final TasksHome = snapshot.data!.where((test)=>test.group=="Home")
            .toList();
        final TasksPersonal = snapshot.data!.where((test)=>test.group=="Personal")
            .toList();

        final inProgressTasks = snapshot.data!
            .where((task) => task.status == 'In Progress')
            .toList();
        int Donetask= snapshot.data!.where((test)=>test.status=="Done").length;
        int totalTasks = snapshot.data!.length;
        double progress = (Donetask / totalTasks) * 100;
        progress = progress.isNaN ? 0 : progress;
        return Column(
          children: [
            SizedBox(height: 26.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: ProgressTask(progress: progress,),
            ),
            SizedBox(height: 26.h,),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 22.w),
              child: Row(
              children: [
                Text("In Progress",style: AppStyel.Scfoold.copyWith(
                    fontSize: 14.sp
                ),),
                SizedBox(width: 10.w,),
                Numberoftask(width: 20.w, height: 20.h,
                    text: "${inProgressTasks.length}",
                    color: Appcolors.primarycolor,
                    Background: Appcolors.Scondarycolor)
                 ]
                    ),
            ),
             SizedBox(height: 16.h,),
             ItemTaskList(inProgressTasks: inProgressTasks),
            SizedBox(height: 26.h,)
            ,
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Task Groups",style: AppStyel.Scfoold),
              SizedBox(height: 16.h,),
              TaskGroub(Icon: AssetIcons.Work,
                  text: "Work", number: TasksinHome.length.toString(),
                  Background: Appcolors.blackcolor,
                  color: Appcolors.primarycolor),
              SizedBox(height: 16.h,),
              TaskGroub(Icon: AssetIcons.Home,
                  Background: Colors.pink,
                  text: "Home", number: TasksHome.length.toString(),
                  color: Appcolors.ligtppink),
              SizedBox(height: 16.h,),
              TaskGroub(Icon: AssetIcons.person,
                  Background: Appcolors.sky,
                  text: "Person", number: TasksPersonal.length.toString(),
                  color: Appcolors.Scondarycolor,

              ),
                ]
              ),
            )
          ],
        );
      }
    );
  }
}
