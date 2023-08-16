import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:rayanik_panel/models/course_model.dart';
import 'package:rayanik_panel/models/create_course_model.dart';

class LessonsViewmodel extends GetxController with StateMixin {
  LessonsViewmodel(this.baseModel);

  final CourseModel baseModel;
  final CreateCourseModel editCourseModel = CreateCourseModel();
  RxInt categoryIndex = 0.obs;
  RxInt weeksCount = 1.obs;
  Rx<Uint8List> imageBytes = Uint8List(0).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fillEditCourseModel();
  }

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowCompression: true, type: FileType.image);

    if (result != null) {
      editCourseModel.filename = result.files.first.name;
      imageBytes.value = result.files.first.bytes ?? Uint8List(0);
    } else {
      // User canceled the picker
    }
  }

  void fillEditCourseModel() {
    editCourseModel.weeksCount = baseModel.weeksCount;
    editCourseModel.price = baseModel.price;
    editCourseModel.title = baseModel.title;
    weeksCount.value = baseModel.weeksCount ?? 0;
  }
}
