import 'dart:typed_data';

import 'package:dio/dio.dart';

class CreateCourseModel {
  String? title, price;
  int? category, weeksCount;
  Uint8List? image;

  Map<String, dynamic> toJson() => {
    'title':title,
    'price':price,
    'weeksCount':weeksCount,
    'category':category,
    'images':MultipartFile.fromBytes(image?.toList()??[],filename: '')
  };
}