import 'package:get/get_connect/http/src/response/response.dart';
import 'package:rayanik_panel/core/constants/urls.dart';
import 'package:rayanik_panel/core/services/connect_instance.dart';

Future<Response<dynamic>> getCourses() async {
  return await getConnect.get(getCoursesUrl);
}
