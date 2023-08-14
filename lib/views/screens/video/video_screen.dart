import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayanik_panel/core/constants/colors.dart';
import 'package:rayanik_panel/views/screens/screens_template.dart';
import 'package:rayanik_panel/views/widgets/course_widget.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt _categoryIndex = 0.obs;
    RxInt _weeksCount = 1.obs;
    Rx<Uint8List> imageBytes = Uint8List(0).obs;
    return ScreensTemplate(
      selectedItem: 0,
      title: "آموزش های ویدیویی",
      titleWidget: InkWell(
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // title
                            SizedBox(
                              width: Get.width / 6,
                              child: TextFormField(
                                decoration:
                                    const InputDecoration(labelText: "عنوان"),
                              ),
                            ),
                            SizedBox(
                              height: Get.height / 35,
                            ),

                            // price
                            SizedBox(
                              width: Get.width / 6,
                              child: TextFormField(
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
                                    value: _categoryIndex.value,
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
                                    onChanged: (value) =>
                                        _categoryIndex.value = value ?? 0))
                              ],
                            ),
                            SizedBox(
                              height: Get.height / 35,
                            ),

                            // weeks count
                            Row(
                              children: [
                                const Text(
                                  "تعداد هفته :",
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
                                    value: _weeksCount.value,
                                    items: List.generate(
                                        5,
                                        (index) => DropdownMenuItem(
                                              value: index + 1,
                                              child:
                                                  Text((index + 1).toString()),
                                            )),
                                    onChanged: (value) =>
                                        _weeksCount.value = value ?? 0))
                              ],
                            ),
                            SizedBox(
                              height: Get.height / 35,
                            ),

                            InkWell(
                              onTap: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                        allowCompression: true,
                                        type: FileType.image);

                                if (result != null) {
                                  imageBytes.value =
                                      result.files.first.bytes ?? Uint8List(0);
                                } else {
                                  // User canceled the picker
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
                                child: Obx(() => imageBytes.value.isEmpty
                                    ? const SizedBox()
                                    : Image.memory(
                                        imageBytes.value,
                                      )),
                              ),
                            ),
                            SizedBox(
                              height: Get.height / 35,
                            ),

                            // upload button
                            Container(
                              // padding: EdgeInsets.symmetric(vertical: 10),

                              width: Get.width,
                              height: Get.height / 18,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: darkBlue),
                              child: Text(
                                "ثبت دوره جدید",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ]),
                    ),
                  ),
                )),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: darkBlue),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(right: 13),
          child: const Text(
            "آموزش جدید",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
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
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.custom(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: Get.width / 35,
                    mainAxisSpacing: 15,
                    crossAxisCount: Get.width ~/ 300),
                childrenDelegate: SliverChildListDelegate(List.generate(25,
                    (index) => CourseWidget(title: "دوره المنتور", weeks: 3)))),
          )
        ]),
      ),
    );
  }
}
