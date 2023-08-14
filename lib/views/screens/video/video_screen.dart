import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayanik_panel/core/constants/colors.dart';
import 'package:rayanik_panel/views/screens/screens_template.dart';
import 'package:rayanik_panel/views/widgets/course_widget.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreensTemplate(
      selectedItem: 0,
      title: "آموزش های ویدیویی",
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              const Text(
                "دوره ها",
                style: TextStyle(fontSize: 26),
              ),
              const SizedBox(width: 15),
              SizedBox(
                  width: Get.width / 4,
                  height: Get.height / 25,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "جست و جو کنید",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  )),
            ],
          ),
          Expanded(
            child: GridView.custom(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: Get.width / 35,
                    mainAxisSpacing: 15,
                    crossAxisCount: Get.width ~/ 300),
                childrenDelegate: SliverChildListDelegate(List.generate(
                    25,
                    (index) => CourseWidget(
                        title: "دوره المنتور",
                        description: "آموزش هوش مصنوعی در المنتور")))),
          )
        ]),
      ),
    );
  }
}
