import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/widget/Textformfaild.dart';
import '../../../../rescorce/asset_icons.dart';
import '../../../../translation/transliton_kay.dart';

class ClenderForm extends StatefulWidget {
  const ClenderForm({super.key});

  @override
  State<ClenderForm> createState() => _ClenderFormState();


  static final DateController = TextEditingController();
}

class _ClenderFormState extends State<ClenderForm> {
  Future<void> pickDateTime(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time == null) return;

    final formattedDate = DateFormat('d MMMM, yyyy').format(date);
    final formattedTime = time.format(context);

    ClenderForm.DateController.text = "$formattedDate    $formattedTime";
  }

  @override
  Widget build(BuildContext context) {
    return Textformfaild(
      readOnly: true,
      obscureText: false,
      keyboardType: TextInputType.text,
      hintText: TranslationKeys.Date,
      OnTap: () => pickDateTime(context),
      controller: ClenderForm.DateController,
      prefixIcon: IconButton(
        onPressed: null,
        icon: SvgPicture.asset(AssetIcons.clander),
      ),
    );
  }
}
