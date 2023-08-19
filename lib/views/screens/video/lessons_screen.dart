import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayanik_panel/core/constants/colors.dart';
import 'package:rayanik_panel/core/constants/urls.dart';
import 'package:rayanik_panel/models/course_model.dart';
import 'package:rayanik_panel/viewmodels/courses/lessons_viewmodel.dart';
import 'package:rayanik_panel/views/screens/screens_template.dart';
import 'package:rayanik_panel/views/widgets/create_lesson_dialog.dart';
import 'package:rayanik_panel/views/widgets/lesson_dialog.dart';
import 'package:rayanik_panel/views/widgets/lessons_widget.dart';
import 'package:rayanik_panel/views/widgets/title_button.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key, required this.model});
  final CourseModel model;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LessonsViewmodel(model));

    return ScreensTemplate(
      selectedItem: 0,
      title: model.title ?? "",
      titleWidget: Row(
        children: [
          InkWell(
              onTap: () => showDialog(
                  context: context,
                  builder: (context) => CreateLessonDialog(
                        courseId: model.id ?? "",
                      )),
              child: const TitleButton(text: "درس جدید")),
          InkWell(
              onTap: () => showDialog(
                  context: context,
                  builder: (context) => Dialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: SizedBox(
                          width: Get.width / 4,
                          height: Get.height / 1.1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 25),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  // title
                                  SizedBox(
                                    width: Get.width / 6,
                                    child: TextFormField(
                                      controller: TextEditingController(
                                          text:
                                              controller.editCourseModel.title),
                                      decoration: const InputDecoration(
                                          labelText: "عنوان"),
                                      onChanged: (value) => controller
                                          .editCourseModel.title = value,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height / 35,
                                  ),

                                  // price
                                  SizedBox(
                                    width: Get.width / 6,
                                    child: TextFormField(
                                      controller: TextEditingController(
                                          text:
                                              controller.editCourseModel.price),
                                      onChanged: (value) => controller
                                          .editCourseModel.price = value,
                                      decoration: const InputDecoration(
                                          labelText: "قیمت (تومان)"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height / 35,
                                  ),

                                  // category
                                  Row(
                                    children: [
                                      const Text(
                                        "دسته بندی :",
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: Get.width / 35,
                                      ),
                                      Obx(() => DropdownButton<int>(
                                          value: controller.categoryIndex.value,
                                          style: TextStyle(
                                              fontSize: 19 *
                                                  MediaQuery.of(context)
                                                      .textScaleFactor),
                                          items: List.generate(
                                              4,
                                              (index) => DropdownMenuItem(
                                                    value: index,
                                                    child: Text([
                                                      "وب",
                                                      "اپلیکیشن",
                                                      "برنامه نویسی",
                                                      "طراحی"
                                                    ][index]),
                                                  )),
                                          onChanged: (value) => controller
                                              .categoryIndex
                                              .value = value ?? 0))
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height / 35,
                                  ),

                                  // weeks count
                                  Row(
                                    children: [
                                      const Text(
                                        "هفته :",
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: Get.width / 35,
                                      ),
                                      Obx(() => DropdownButton<int>(
                                          style: TextStyle(
                                              fontSize: 19 *
                                                  MediaQuery.of(context)
                                                      .textScaleFactor),
                                          value: controller.weeksCount.value,
                                          items: List.generate(
                                              5,
                                              (index) => DropdownMenuItem(
                                                    value: index + 1,
                                                    child: Text(
                                                        (index + 1).toString()),
                                                  )),
                                          onChanged: (value) => controller
                                              .weeksCount.value = value ?? 0))
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height / 35,
                                  ),

                                  InkWell(
                                    onTap: controller.pickImage,
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: darkBlue),
                                      child: const Text(
                                        "انتخاب عکس",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height / 35,
                                  ),

                                  // image
                                  SizedBox.square(
                                    dimension: Get.width / 7,
                                    child: Center(
                                      child: Obx(() => controller
                                              .imageBytes.value.isEmpty
                                          ? Image.network(
                                              '$baseUrl/uploads/${model.imageUrl ?? ""}')
                                          : Image.memory(
                                              controller.imageBytes.value,
                                            )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height / 35,
                                  ),

                                  // upload button
                                  InkWell(
                                    // onTap: controller.addCourse,
                                    child: Container(
                                      width: Get.width,
                                      height: Get.height / 18,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: darkBlue),
                                      child: const Text(
                                        "ویرایش دوره",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      )),
              child: const TitleButton(text: "ویرایش دوره")),
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.all(25),
          child: ListView(
              children: List.generate(
                  controller.lessonsList.length,
                  (index) => SizedBox(
                        width: Get.width,
                        height: Get.height / 3.2,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "هفته ${index + 1} ",
                                style: TextStyle(
                                    fontSize: 22 *
                                        MediaQuery.of(context).textScaleFactor),
                              ),
                              Expanded(
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          controller.lessonsList[index].length,
                                      itemBuilder: (_, lessonIndex) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: LessonsWidget(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) => LessonDialog(
                                                        videoUrl: controller
                                                                .lessonsList[
                                                                    index][
                                                                    lessonIndex]
                                                                .videoUrl ??
                                                            "",
                                                        description: controller
                                                                .lessonsList[
                                                                    index][
                                                                    lessonIndex]
                                                                .description ??
                                                            ""),
                                                  );
                                                },
                                                title: controller
                                                        .lessonsList[index]
                                                            [lessonIndex]
                                                        .title ??
                                                    "",
                                                imageUrl: controller
                                                        .lessonsList[index]
                                                            [lessonIndex]
                                                        .imageUrl ??
                                                    ""),
                                          ))),
                              SizedBox(
                                height: Get.height / 45,
                              )
                            ]),
                      )))),
    );
  }
}
