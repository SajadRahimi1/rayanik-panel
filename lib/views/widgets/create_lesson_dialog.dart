import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayanik_panel/core/constants/colors.dart';
import 'package:rayanik_panel/core/services/message_service.dart';
import 'package:rayanik_panel/core/services/picker_service.dart'
    as pricker_service;
import 'package:rayanik_panel/models/create_lesson_model.dart';
import 'package:rayanik_panel/core/services/lesson_service.dart' as service;

class CreateLessonDialog extends StatelessWidget {
  const CreateLessonDialog(
      {super.key, this.maxWeeksLengh = 1, required this.courseId});
  final int maxWeeksLengh;
  final String courseId;

  @override
  Widget build(BuildContext context) {
    Uint8List video = Uint8List(0);
    Rx<Uint8List> image = Uint8List(0).obs;
    RxString videoName = "".obs, imageName = "".obs;
    RxInt weekNumber = 1.obs;
    RxBool isUploading = false.obs;

    CreateLessonModel model = CreateLessonModel();

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: Get.width / 4,
        height: Get.height / 1.1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // title
                SizedBox(
                  width: Get.width / 6,
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "عنوان"),
                    onChanged: (value) => model.title = value,
                  ),
                ),
                SizedBox(
                  height: Get.height / 35,
                ),
                SizedBox(
                  width: Get.width / 6,
                  height: Get.height / 10,
                  child: TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                        labelText: "توضیحات",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    onChanged: (value) => model.description = value,
                  ),
                ),
                SizedBox(
                  height: Get.height / 35,
                ),
                // weeks count
                Row(
                  children: [
                    const Text(
                      "هفته: ",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    SizedBox(
                      width: Get.width / 35,
                    ),
                    Obx(() => DropdownButton<int>(
                        style: TextStyle(
                            fontSize:
                                19 * MediaQuery.of(context).textScaleFactor),
                        value: weekNumber.value,
                        items: List.generate(
                            5,
                            (index) => DropdownMenuItem(
                                  value: index + 1,
                                  child: Text((index + 1).toString()),
                                )),
                        onChanged: (value) => weekNumber.value = value ?? 0))
                  ],
                ),
                SizedBox(
                  height: Get.height / 35,
                ),

                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        var videoFile =
                            await pricker_service.pickFile(typeIndex: 3);
                        if (videoFile != null) {
                          videoName.value = videoFile.files.single.name;
                          video = videoFile.files.single.bytes ?? Uint8List(0);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: darkBlue),
                        child: const Text(
                          "انتخاب ویدیو",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Obx(() => Text(
                              "\t\t${videoName.value}",
                              overflow: TextOverflow.ellipsis,
                            )))
                  ],
                ),

                SizedBox(
                  height: Get.height / 35,
                ),

                InkWell(
                  onTap: () async {
                    var imageFile =
                        await pricker_service.pickFile(typeIndex: 2);
                    if (imageFile != null) {
                      imageName.value = imageFile.files.single.name;
                      image.value =
                          imageFile.files.single.bytes ?? Uint8List(0);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
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
                    child: Obx(() => image.value.isEmpty
                        ? const SizedBox()
                        : Image.memory(
                            image.value,
                          )),
                  ),
                ),
                SizedBox(
                  height: Get.height / 35,
                ),

                // upload button
                InkWell(
                  onTap: () async {
                    model.videoName = videoName.value;
                    model.imageName = imageName.value;
                    model.image = image.value;
                    model.video = video;
                    model.weekNumber = weekNumber.value;
                    model.courseId = courseId;
                    isUploading.value = true;
                    try {
                      final request = await service.addCourse(model: model);
                      if (request.statusCode == 200) {
                        isUploading.value = false;
                        Navigator.pop(context);
                        showMessage(
                            context: context,
                            message: "درس با موفقیت اضافه شد",
                            type: MessageType.success);
                      } else {
                        isUploading.value = false;
                        showMessage(
                            context: context,
                            message: request.data,
                            type: MessageType.error);
                      }
                    } on DioException catch (e) {
                      print(e.response?.data);
                    }
                  },
                  child: Container(
                    width: Get.width,
                    height: Get.height / 18,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: darkBlue),
                    child: Obx(() => isUploading.value
                        ? Row(
                            children: [
                              Text(
                                "در حال آپلود...\t\t",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16 *
                                        MediaQuery.of(context).textScaleFactor),
                              ),
                            ],
                          )
                        : Text(
                            "ثبت درس جدید",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18 *
                                    MediaQuery.of(context).textScaleFactor),
                          )),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
