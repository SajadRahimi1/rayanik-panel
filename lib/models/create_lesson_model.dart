import 'dart:typed_data';

import 'package:dio/dio.dart';

class CreateLessonModel {
  String? courseId, title, description, imageName, videoName;
  int? weekNumber;
  Uint8List? image, video;

  Map<String, dynamic> toJson() => {
        'courseId': courseId,
        'title': title,
        'description': description,
        'weekNumber': weekNumber,
        'image':
            MultipartFile.fromBytes(image?.toList() ?? [], filename: imageName),
        'video':
            MultipartFile.fromBytes(video?.toList() ?? [], filename: videoName),
      };
}
