import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/thiming/color.dart';
import '../../../../core/thiming/styles.dart';
import '../../../../translation/transliton_kay.dart';

class Dropdowengroub extends StatefulWidget {
  final Function(String?) onChanged;
 late bool isEnabled;
  final String? initialValue;

   Dropdowengroub({
    super.key,
    required this.onChanged,
    this.isEnabled = true,
    this.initialValue,
  });

  @override
  State<Dropdowengroub> createState() => _DropdowengroubState();
}

class _DropdowengroubState extends State<Dropdowengroub> {
  String? selectedValue;

  final List<Map<String, dynamic>> items = [
    {'label': TranslationKeys.Home, 'icon': Icons.home, 'color': Colors.pink},
    {'label': TranslationKeys.Personal, 'icon': Icons.person, 'color': Colors.green},
    {'label': TranslationKeys.Work, 'icon': Icons.work, 'color': Colors.black},
  ];

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63.h,
      width: 331.w,
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        borderRadius: BorderRadius.circular(20),
        style: AppStyel.StyleLetsStart2.copyWith(
          color: Appcolors.blackcolor,
          fontWeight: FontWeight.w300,
        ),
        decoration: InputDecoration(
          hintText: widget.isEnabled ? TranslationKeys.Group : 'Group Selected',
          hintStyle: AppStyel.StyleLetsStart2.copyWith(
            color: Appcolors.lightGrey,
            fontWeight: FontWeight.w300,
          ),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Appcolors.lightGrey, width: 1.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.greenAccent, width: 1.w),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Appcolors.lightGrey, width: 1.w),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        ),
        validator: (value) => widget.isEnabled && value == null ? "Please select a group" : null,
        onChanged: widget.isEnabled
            ? (value) {
          if (mounted) {
            setState(() => selectedValue = value);
            widget.onChanged(value);
          }
        }
            : null,
        disabledHint: selectedValue != null
            ?Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: items
                    .firstWhere((item) => item['label'] == selectedValue)['color']
                    .withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                items.firstWhere((item) => item['label'] == selectedValue)['icon'],
                color: items.firstWhere((item) => item['label'] == selectedValue)['color'],
                size: 20,
              ),
            ),
            SizedBox(width: 15.w),
            Text(selectedValue!),
          ],
        )
            : Text('No group selected'),
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item['label'],
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: item['color'].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(item['icon'], color: item['color'], size: 20),
                ),
                SizedBox(width: 15.w),
                Text(item['label']),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}