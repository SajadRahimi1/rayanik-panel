import 'package:flutter/material.dart';
import 'package:rayanik_panel/core/constants/colors.dart';
import 'package:rayanik_panel/views/widgets/menu.dart';

class ScreensTemplate extends StatelessWidget {
  const ScreensTemplate(
      {super.key, required this.selectedItem, required this.title, this.child});
  final int selectedItem;
  final Widget? child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Menu(
      selectedItem: selectedItem,
      home: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height / 10.4,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                border:
                    BorderDirectional(bottom: BorderSide(color: Colors.black))),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 26 * MediaQuery.of(context).textScaleFactor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            color: lightBlue,
            child: child,
          ))
        ],
      ),
    );
  }
}
