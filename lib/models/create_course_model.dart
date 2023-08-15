import 'dart:typed_data';
import 'package:uuid/uuid.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart' show MediaType;

class CreateCourseModel {
  String? title, price;
  int? category, weeksCount;
  Uint8List? image;

  Map<String, dynamic> toJson() => {
        'title': title,
        'price': price,
        'weeksCount': weeksCount,
        'category': category,
        'image': MultipartFile.fromBytes(
          image?.toList() ?? [],
          filename: const Uuid().v4(),
        )
      };
}
