import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todooappnit/features/viewtaskes/view/widgets/alartdilg.dart';
import 'package:todooappnit/features/viewtaskes/view/widgets/search_widget.dart';
import 'package:todooappnit/features/viewtaskes/view/widgets/taskCount.dart';
import 'package:todooappnit/features/viewtaskes/view/widgets/viewTask_Item.dart';
import 'package:todooappnit/features/viewtaskes/view/widgets/viewTask_list.dart';

import '../../../core/thiming/color.dart';
import '../../../core/thiming/styles.dart';
import '../../../core/widget/paperplusBottom.dart';
import '../../../rescorce/asset_icons.dart';
import '../../add_task/manager/cubit_Addtask.dart';
import '../../add_task/data/models/Taskmodel.dart';

class ViewTaskScreen extends StatefulWidget {
  const ViewTaskScreen({super.key});

  @override
  State<ViewTaskScreen> createState() => _ViewTaskScreenState();
}

class _ViewTaskScreenState extends State<ViewTaskScreen> {
  final TextEditingController _controller = TextEditingController();
  String _query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.background,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(AssetIcons.arrowback),
        ),
        centerTitle: true,
        title: Text('Tasks', style: AppStyel.Scfoold),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 22.r, vertical: 23.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ✅ Search bar
            SearchWidget(
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  _query = value;
                });
              },
            ),
            SizedBox(height: 23.h),

            /// ✅ Result + counter
            Row(
              children: [
                Text(
                  "Result",
                  style: AppStyel.StyleLetsStart1.copyWith(fontSize: 14.sp),
                ),
                SizedBox(width: 30.w),
                const TaskCountWidget(),
              ],
            ),
            SizedBox(height: 23.h),

            /// ✅ Task List (search or all)
            Expanded(
              child: _query.isEmpty
                  ? const ViewtaskList() // الحالة العادية
                  : StreamBuilder<List<Taskmodel>>(
                stream: TaskCubit.get(context)
                    .homeRepo
                    .searchTasks(_query), // 🔍 البحث
                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(
                        child: Text("Error loading tasks"));
                  }

                  final tasks = snapshot.data ?? [];

                  // ✅ لو مفيش نتائج بحث رجّع اللستة الأصلية
                  if (tasks.isEmpty) {
                    return Center(child: Text("No tasks found"));
                  }
                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return ViewtaskItem(taskmodel: tasks[index],); // ✅ نفس ديزاين اللستة
                    },
                  );
                },
              ),
            ),

            /// ✅ Filter button
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: BaberPlusBouttom(
                  Icon: AssetIcons.filter,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Alartdilg(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
