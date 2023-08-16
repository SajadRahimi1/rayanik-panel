import 'package:flutter/material.dart';
import 'package:rayanik_panel/core/constants/colors.dart';

class TitleButton extends StatelessWidget {
  const TitleButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: darkBlue),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(right: 13),
      child:  Text(
       text,
        style:const TextStyle(color: Colors.white),
      ),
    );
  }
}
