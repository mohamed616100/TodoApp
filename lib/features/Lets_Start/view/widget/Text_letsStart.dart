import 'package:flutter/material.dart';

import '../../../../core/thiming/styles.dart';
class TextLetsstart extends StatelessWidget {
  const TextLetsstart({super.key, this.text, this.style});
   final text;
   final style;
  @override
  Widget build(BuildContext context) {
    return Text("$text",style: style,);
  }
}
