// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayanik_panel/core/services/course_service/create_course_service.dart'
    as service;
import 'package:rayanik_panel/core/services/course_service/course_service.dart'
    as service;
import 'package:rayanik_panel/core/services/message_service.dart';
import 'package:rayanik_panel/models/course_model.dart';
import 'package:rayanik_panel/models/create_course_model.dart';

class CoursesViewModel extends GetxController with StateMixin {
  CoursesViewModel({required this.context});
  final BuildContext context;
  final CreateCourseModel createCourseModel = CreateCourseModel();
  List<CourseModel> baseCourseModel = [];
  List<CourseModel> courseModel = [];
  RxInt categoryIndex = 0.obs;
  RxInt weeksCount = 1.obs;
  Rx<Uint8List> imageBytes = Uint8List(0).obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getCourses();
  }

  Future<void> getCourses() async {
    try {
      final request = await service.getCourses();
      baseCourseModel = List<CourseModel>.from(
          request.body.map((x) => CourseModel.fromJson(x)));
      courseModel = baseCourseModel;
      change(null, status: RxStatus.success());
    } on DioException {
      networkErrorMessage(context);
      change(null, status: RxStatus.error());
    }
  }

  Future<void> addCourse() async {
    if (validateCreateCourse()) {
      createCourseModel
        ..weeksCount = weeksCount.value
        ..category = categoryIndex.value;
      try {
        final request = await service.addCourse(model: createCourseModel);

        if (request.statusCode == 200) {
          Navigator.pop(context);
          showMessage(
              context: context,
              message: "دوره با موفقیت ایجاد شد",
              type: MessageType.success);
          change(null, status: RxStatus.loading());
          await getCourses();
        } else {
          // networkErrorMessage();
        }
      } on DioException catch (e) {
        print(e.response?.data);
      }
    }
  }

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowCompression: true, type: FileType.image);

    if (result != null) {
      createCourseModel.filename = result.files.first.name;
      imageBytes.value = result.files.first.bytes ?? Uint8List(0);
    } else {
      // User canceled the picker
    }
  }

  void search(String title) {
    change(null, status: RxStatus.loading());
    courseModel = [];
    if (title.isEmpty) {
      courseModel = baseCourseModel;
    } else {
      courseModel = baseCourseModel
          .where((element) => element.title?.contains(title) ?? false)
          .toList();
    }
    change(null, status: RxStatus.success());
  }

  bool validateCreateCourse() {
    createCourseModel.image = imageBytes.value;
    if (createCourseModel.title?.isEmpty ?? true) {
      showMessage(
          context: context,
          message: "عنوان نمیتواند خالی باشد",
          type: MessageType.warning);
      return false;
    }
    if (createCourseModel.image?.isEmpty ?? true) {
      showMessage(
          context: context,
          message: "عکس نمیتواند خالی باشد",
          type: MessageType.warning);

      return false;
    }
    return true;
  }
}
