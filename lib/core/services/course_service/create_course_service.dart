import 'package:dio/dio.dart';
import 'package:rayanik_panel/core/constants/urls.dart';
import 'package:rayanik_panel/models/create_course_model.dart';


final Dio dio =
    Dio(BaseOptions(receiveTimeout: Duration(seconds: 12), headers: {
  "Access-Control-Allow-Origin": "*",
  'Accept': '*/*',
  "Access-Control-Allow-Credentials":
      true, // Required for cookies, authorization headers with HTTPS
  "Access-Control-Allow-Headers":
      "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  "Access-Control-Allow-Methods": "POST, OPTIONS, GET"
}));

Future<Response<dynamic>> addCourse({required CreateCourseModel model}) async {
  var formData = FormData.fromMap(model.toJson());

  return await dio.post(
    createCourseUrl,
    data: formData,
  );
}

