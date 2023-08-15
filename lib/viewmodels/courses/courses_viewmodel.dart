import 'dart:js';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayanik_panel/core/services/course_service.dart' as service;
import 'package:rayanik_panel/core/services/message_service.dart';
import 'package:rayanik_panel/models/create_coursr_model.dart';

class CoursesViewModel extends GetxController with StateMixin {
  CoursesViewModel({required this.context});
  final BuildContext context;
  final CreateCourseModel createCourseModel = CreateCourseModel();
  RxInt categoryIndex = 0.obs;
  RxInt weeksCount = 1.obs;
  Rx<Uint8List> imageBytes = Uint8List(0).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> addCourse() async {
    if (validateCreateCourse()) {
      createCourseModel
        ..image = imageBytes.value
        ..weeksCount = weeksCount.value
        ..category = categoryIndex.value;

      final request = await service.addCourse(model: createCourseModel);

      if (request.statusCode == 200) {
        showMessage(
            context: context,
            message: "دوره با موفقیت ایجاد شد",
            type: MessageType.success);
      } else {
        // networkErrorMessage();
      }
    }
  }

  void cl() {
    print("ss");
  }

  bool validateCreateCourse() {
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
