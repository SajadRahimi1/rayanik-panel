import 'package:get/get_connect/http/src/response/response.dart' as connect;
import 'package:rayanik_panel/core/constants/urls.dart';
import 'package:rayanik_panel/core/services/connect_instance.dart';
import 'package:rayanik_panel/models/create_book_model.dart';
import 'package:dio/dio.dart';

Future<connect.Response<dynamic>> getAllBooks() async {
  return await getConnect.get(getBooksUrl);
}

Future<Response<dynamic>> createBook(CreateBookModel bookModel) async {
  final Dio dio =
      Dio(BaseOptions(receiveTimeout: const Duration(seconds: 12), headers: {
    "Access-Control-Allow-Origin": "*",
    'Accept': '*/*',
  }));
  var formData = FormData.fromMap(bookModel.toJson());

  return await dio.post(
    createBooksUrl,
    data: formData,
  );
}
