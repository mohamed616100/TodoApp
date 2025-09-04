import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todooappnit/core/helper/extantion.dart';
import 'package:todooappnit/features/editTask/view/editscreenInProgress/body_inProggress.dart';
import 'package:todooappnit/features/editTask/view/editscreenisDone/body_done.dart';
import 'package:todooappnit/rescorce/asset_icons.dart';

import '../../../core/routs/Routs.dart';
import '../../../core/thiming/color.dart';
import '../../../core/thiming/styles.dart';
import '../../add_task/data/models/Taskmodel.dart';
import '../../add_task/manager/cubit_Addtask.dart';
class EditScreen extends StatefulWidget {
  const EditScreen({super.key, required this.Task, });
final Taskmodel Task;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.background,
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:SvgPicture.asset(AssetIcons.arrowback)),
        title: Text('Edit Task',style: AppStyel.Scfoold,),
        actions: [
         InkWell(
           onTap: (){
            TaskCubit.get(context).homeRepo.deleteTask(
              widget.Task.id!,
            );
            context.PushName(Routs.HomeScreen );
           },
           child: Container(
             margin: EdgeInsets.only(right: 16.w),
             width: 80.w,
             height: 28.h,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(14.r),
               color: Colors.red,
             ),
             child:Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SvgPicture.asset(AssetIcons.delete,width: 14.w,height: 14.h,),
                 SizedBox(width: 4.w,),
                 Text('Delete',style: AppStyel.Scfoold.copyWith(
                   color: Colors.white,
                   fontSize: 12.sp,
                   fontWeight: FontWeight.w300
                 ),),
              ]
                 ),
           ),
         )
        ],
      ),
      body:widget.Task.status==("Done")?BodyDone(
        taskmodel: widget.Task,
      ):BodyInproggress(taskmodel: widget.Task,),
    );
  }
}
