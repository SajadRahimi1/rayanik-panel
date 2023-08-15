import 'package:dio/dio.dart';
import 'package:rayanik_panel/core/constants/urls.dart';
import 'package:rayanik_panel/models/create_coursr_model.dart';

Future<Response<dynamic>> addCourse({required CreateCourseModel model}) async {
  final Dio dio = Dio(BaseOptions(receiveTimeout: Duration(seconds: 12)));
  var formData = FormData.fromMap(model.toJson());

  return await dio.post(createCourseUrl, data: formData);
}
