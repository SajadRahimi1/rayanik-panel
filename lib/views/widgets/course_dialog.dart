import 'package:flutter/material.dart';
import 'package:rayanik_panel/core/constants/colors.dart';

class CourseDialog extends StatelessWidget {
  const CourseDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width / 4,
        height: MediaQuery.sizeOf(context).height / 1.1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // title
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 6,
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "عنوان"),
                    onChanged: (value) =>
                        controller.createCourseModel.title = value,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 35,
                ),

                // price
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 6,
                  child: TextFormField(
                    onChanged: (value) =>
                        controller.createCourseModel.price = value,
                    decoration:
                        const InputDecoration(labelText: "قیمت (تومان)"),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 35,
                ),

                // category
                Row(
                  children: [
                    const Text(
                      "دسته بندی :",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 35,
                    ),
                    Obx(() => DropdownButton<int>(
                        value: controller.categoryIndex.value,
                        style: TextStyle(
                            fontSize:
                                19 * MediaQuery.of(context).textScaleFactor),
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
                            controller.categoryIndex.value = value ?? 0))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 35,
                ),

                // weeks count
                Row(
                  children: [
                    const Text(
                      "تعداد هفته :",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 35,
                    ),
                    Obx(() => DropdownButton<int>(
                        style: TextStyle(
                            fontSize:
                                19 * MediaQuery.of(context).textScaleFactor),
                        value: controller.weeksCount.value,
                        items: List.generate(
                            5,
                            (index) => DropdownMenuItem(
                                  value: index + 1,
                                  child: Text((index + 1).toString()),
                                )),
                        onChanged: (value) =>
                            controller.weeksCount.value = value ?? 0))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 35,
                ),

                InkWell(
                  onTap: controller.pickImage,
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
                  height: MediaQuery.sizeOf(context).height / 35,
                ),

                // image
                SizedBox.square(
                  dimension: MediaQuery.sizeOf(context).width / 7,
                  child: Center(
                    child: Obx(() => controller.imageBytes.value.isEmpty
                        ? const SizedBox()
                        : Image.memory(
                            controller.imageBytes.value,
                          )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 35,
                ),

                // upload button
                InkWell(
                  onTap: controller.addCourse,
                  child: Container(
                    width: MediaQuery.sizeOf(context). width,
                    height: MediaQuery.sizeOf(context).height / 18,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: darkBlue),
                    child: const Text(
                      "ثبت دوره جدید",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
