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

  List<List<Lessons>> lessonsList = [];


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fillEditCourseModel();
    lessonsList = List.generate(baseModel.weeksCount ?? 1, (index) => []);
    fillLesson();
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

  void fillLesson() {
    for (int i = 0; i < lessonsList.length; i++) {
      lessonsList[i] = baseModel.lessons
              ?.where((element) => element.weekNumber == i + 1)
              .toList() ??
          [];
    }
  }

  
}
