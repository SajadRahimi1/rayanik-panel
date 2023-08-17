import 'package:get/get_connect/http/src/response/response.dart';
import 'package:rayanik_panel/core/constants/urls.dart';
import 'package:rayanik_panel/core/services/connect_instance.dart';

Future<Response<dynamic>> getAllBooks() async {
  return await getConnect.get(getBooksUrl);
}
