import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';


import '../../rescorce/asset_icons.dart';
import '../../translation/transliton_kay.dart';

class DateForm extends StatefulWidget {
 final bool enabel;
 final TextEditingController DateController ;

 const DateForm({super.key, required this.enabel, required this.DateController});

  @override
  State<DateForm> createState() => _DateFormState();
}

class _DateFormState extends State<DateForm> {

  Future<void> pickDateTime(BuildContext context) async {
    final DateTime now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(now),
    );

    if (time == null) return;

    final formattedDate = DateFormat('d MMMM, yyyy').format(date);
    final formattedTime = time.format(context);

    setState(() {
      widget.DateController.text = "$formattedDate    $formattedTime";
    });
  }

  @override
  void dispose() {
   widget.DateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: !widget.enabel,
      obscureText: false,
      keyboardType: TextInputType.text,
      controller: widget.DateController,
      onTap: () => pickDateTime(context),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: TranslationKeys.Date,
        prefixIcon: IconButton(
          onPressed: null,
          icon: SvgPicture.asset(
            AssetIcons.clander,
            color: Color(0xFF4CAF50),
            width: 20,
            height: 20,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
        ),
      ),
    );
  }
}