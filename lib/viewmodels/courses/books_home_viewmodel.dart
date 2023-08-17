import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayanik_panel/core/services/books_service/books_service.dart'
    as service;
import 'package:rayanik_panel/core/services/message_service.dart';
import 'package:rayanik_panel/models/books_model.dart';

class BookHomeViewModel extends GetxController with StateMixin {
  BookHomeViewModel(this.context);

  final BuildContext context;

  List<BooksModel> basebooksList = [];
  List<BooksModel> booksList = [];

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getData();
  }

  Future<void> getData() async {
    final request = await service.getAllBooks();
    if (request.statusCode == 200) {
      basebooksList = List<BooksModel>.from(
          request.body.map((x) => BooksModel.fromJson(x)));
      booksList = basebooksList;
      change(null, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error(request.body));
      networkErrorMessage(context);
    }
  }

  void search(String value) {
    change(null, status: RxStatus.loading());
    booksList = [];
    if (value.isEmpty) {
      booksList = basebooksList;
    }
    booksList = basebooksList
        .where((element) =>
            (element.title?.contains(value) ?? false) ||
            (element.author?.contains(value) ?? false))
        .toList();
        change(null, status: RxStatus.success());
  }
}
