import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/thiming/color.dart';
import '../../../../core/widget/Bottom_widget.dart';
import '../../../../core/widget/DateField.dart';
import 'Countiner_typeofWork.dart';
class Alartdilg extends StatefulWidget {
  const Alartdilg({super.key});
  @override
  State<Alartdilg> createState() => _AlartdilgState();
}
class _AlartdilgState extends State<Alartdilg> {
  final dateController = TextEditingController();
  String? selectedCategory;
  String? selectedStatus;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      content: Container(
        width: 329.w,
        height: 381.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            children: [
              // ---------- Categories ----------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CountinerTypeofwork(
                    onTap: () => setState(() => selectedCategory = "All"),
                    colortext: selectedCategory == "All" ? Colors.white : Colors.black,
                    colorbackground: selectedCategory == "All"
                        ? Appcolors.Scondarycolor
                        : Colors.white,
                    text: "All",
                    width: 70.w,
                  ),
                  CountinerTypeofwork(
                    onTap: () => setState(() => selectedCategory = "Work"),
                    colortext: selectedCategory == "Work" ? Colors.white : Colors.black,
                    colorbackground: selectedCategory == "Work"
                        ? Appcolors.Scondarycolor
                        : Colors.white,
                    text: "Work",
                    width: 70.w,
                  ),
                  CountinerTypeofwork(
                    onTap: () => setState(() => selectedCategory = "Home"),
                    colortext: selectedCategory == "Home" ? Colors.white : Colors.black,
                    colorbackground: selectedCategory == "Home"
                        ? Appcolors.Scondarycolor
                        : Colors.white,
                    text: "Home",
                    width: 70.w,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  CountinerTypeofwork(
                    onTap: () => setState(() => selectedCategory = "Personal"),
                    colortext: selectedCategory == "Personal" ? Colors.white : Colors.black,
                    colorbackground: selectedCategory == "Personal"
                        ? Appcolors.Scondarycolor
                        : Colors.white,
                    text: "Personal",
                    width: 89.w,
                  ),
                ],
              ),

              // ---------- Status ----------
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CountinerTypeofwork(
                    onTap: () => setState(() => selectedStatus = "All"),
                    colortext: selectedStatus == "All" ? Colors.white : Colors.black,
                    colorbackground: selectedStatus == "All"
                        ? Appcolors.Scondarycolor
                        : Colors.white,
                    text: "All",
                    width: 70.w,
                  ),
                  CountinerTypeofwork(
                    onTap: () => setState(() => selectedStatus = "In Progress"),
                    colortext: selectedStatus == "In Progress" ? Colors.white : Colors.black,
                    colorbackground: selectedStatus == "In Progress"
                        ? Appcolors.Scondarycolor
                        : Colors.white,
                    text: "In Progress",
                    width: 89.w,
                  ),
                  CountinerTypeofwork(
                    onTap: () => setState(() => selectedStatus = "Missed"),
                    colortext: selectedStatus == "Missed" ? Colors.white : Colors.black,
                    colorbackground: selectedStatus == "Missed"
                        ? Appcolors.Scondarycolor
                        : Colors.white,
                    text: "Missed",
                    width: 70.w,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  CountinerTypeofwork(
                    onTap: () => setState(() => selectedStatus = "Done"),
                    colortext: selectedStatus == "Done" ? Colors.white : Colors.black,
                    colorbackground: selectedStatus == "Done"
                        ? Appcolors.Scondarycolor
                        : Colors.white,
                    text: "Done",
                    width: 70.w,
                  ),
                ],
              ),

              // ---------- Date ----------
              SizedBox(height: 25.h),
              DateForm(
                enabel: false,
                DateController: dateController,
              ),

              // ---------- Filter Button ----------
              SizedBox(height: 25.h),
              Expanded(
                child: BottomWidget(
                  text: 'Filter',
                  onTap: () {
                    Navigator.pop(context, {
                      "category": selectedCategory,
                      "status": selectedStatus,
                      "date": dateController.text,
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
