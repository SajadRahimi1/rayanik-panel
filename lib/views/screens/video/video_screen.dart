import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayanik_panel/core/constants/colors.dart';
import 'package:rayanik_panel/views/widgets/menu.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Menu(
      selectedItem: 0,
      home: Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height / 10.4,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                border:
                    BorderDirectional(bottom: BorderSide(color: Colors.black))),
            child: Text(
              "آموزش های ویدیویی",
              style: TextStyle(
                  fontSize: 26 * MediaQuery.of(context).textScaleFactor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: Container(
            color: lightBlue,
          ))
        ],
      ),
    );
  }
}
