import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayanik_panel/core/constants/colors.dart';
import 'package:rayanik_panel/views/screens/screens_template.dart';
import 'package:rayanik_panel/views/widgets/menu.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreensTemplate(
      selectedItem: 0,
      title: "آموزش های ویدیویی",
    );
  }
}
