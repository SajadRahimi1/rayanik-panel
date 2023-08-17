import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayanik_panel/viewmodels/courses/books_home_viewmodel.dart';
import 'package:rayanik_panel/views/screens/screens_template.dart';
import 'package:rayanik_panel/views/widgets/book_widget.dart';

class BooksHomeScreen extends StatelessWidget {
  const BooksHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookHomeViewModel(context));

    return ScreensTemplate(
      selectedItem: 4,
      title: "مدیریت کتاب ها",
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "کتاب ها",
                  style: TextStyle(
                      fontSize: 26 * MediaQuery.of(context).textScaleFactor),
                ),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                    width: Get.width / 4,
                    height: Get.height / 25,
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.bottom,
                      onChanged: (value) => controller.search(value),
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
            SizedBox(
              height: Get.height / 35,
            ),
            Expanded(
                child: controller.obx((state) => GridView.custom(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: Get.width / 55,
                        mainAxisSpacing: 15,
                        childAspectRatio: 0.8,
                        crossAxisCount: Get.width ~/ 300),
                    childrenDelegate: SliverChildBuilderDelegate(
                        (context, index) => BookWidget(
                            imageUrl:
                                controller.booksList[index].imageUrl ?? "",
                            title: controller.booksList[index].title ?? "",
                            author: controller.booksList[index].author ?? ""),
                        childCount: controller.booksList.length))))
          ],
        ),
      ),
    );
  }
}
