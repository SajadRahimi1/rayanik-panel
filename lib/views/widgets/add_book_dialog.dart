import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayanik_panel/core/constants/colors.dart';
import 'package:rayanik_panel/core/services/picker_service.dart';
import 'package:rayanik_panel/models/create_book_model.dart';

class AddBookDialog extends StatelessWidget {
  const AddBookDialog({super.key, required this.onUploadTap});
  final void Function(CreateBookModel bookModel) onUploadTap;

  @override
  Widget build(BuildContext context) {
    Rx<Uint8List> image = Uint8List(0).obs, pdf = Uint8List(0).obs;
    RxString pdfFileName = "".obs;
    final CreateBookModel bookModel = CreateBookModel();

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
                    onChanged: (value) => bookModel.title = value,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 35,
                ),

                // author
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 6,
                  child: TextFormField(
                    onChanged: (value) => bookModel.author = value,
                    decoration: const InputDecoration(labelText: "نویسنده"),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 35,
                ),

                // author
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 6,
                  child: TextFormField(
                    onChanged: (value) => bookModel.publisher = value,
                    decoration: const InputDecoration(labelText: "انتشارات"),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 35,
                ),

                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 6,
                  height: MediaQuery.sizeOf(context).height / 10,
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
                    onChanged: (value) => bookModel.description = value,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 35,
                ),

                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        var pdfFile = await pickFile(
                            typeIndex: 5, allowedExtensions: ['pdf']);
                        if (pdfFile != null) {
                          bookModel.pdfFileName = pdfFile.files.single.name;
                          pdfFileName.value = pdfFile.files.single.name;
                          pdf.value =
                              pdfFile.files.single.bytes ?? Uint8List(0);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: darkBlue),
                        child: const Text(
                          "انتخاب فایل pdf",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Obx(() => Text(
                              "\t\t${pdfFileName.value}",
                              overflow: TextOverflow.ellipsis,
                            )))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 35,
                ),

                InkWell(
                  onTap: () async {
                    final pickedImage = await pickFile(typeIndex: 2);
                    if (pickedImage != null) {
                      bookModel.imageFileName = pickedImage.files.single.name;
                      image.value =
                          pickedImage.files.single.bytes ?? Uint8List(0);
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
                  height: MediaQuery.sizeOf(context).height / 35,
                ),

                // image
                SizedBox.square(
                  dimension: MediaQuery.sizeOf(context).width / 9,
                  child: Center(
                    child: Obx(() => image.value.isEmpty
                        ? const SizedBox()
                        : Image.memory(
                            image.value,
                          )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 35,
                ),

                // upload button
                InkWell(
                  onTap: () {
                    bookModel.image = image.value;
                    bookModel.pdf = pdf.value;
                    onUploadTap(bookModel);
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
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
