import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayanik_panel/core/services/books_service/books_service.dart'
    as service;
import 'package:rayanik_panel/core/services/message_service.dart';
import 'package:rayanik_panel/models/books_model.dart';
import 'package:rayanik_panel/models/create_book_model.dart';

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
    change(null, status: RxStatus.loading());
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

  Future<void> createBook(CreateBookModel bookModel) async {
    try {
      final request = await service.createBook(bookModel);
      if (request.statusCode == 200) {
        print(request.data);
        Navigator.pop(context);
        showMessage(
            context: context,
            message: "کتاب با موفقیت اضافه شد",
            type: MessageType.success);
        await getData();
      } else {
        networkErrorMessage(context);
      }
    } on DioException catch (e) {
      showMessage(
          context: context,
          message: e.response?.data ?? "",
          type: MessageType.error);
    }
  }

  Future<void> editBook(CreateBookModel bookModel) async {
    try {
      final request = await service.editBook(bookModel);
      if (request.statusCode == 200) {
        print(request.data);
        Navigator.pop(context);
        showMessage(
            context: context,
            message: "کتاب با موفقیت ویرایش شد",
            type: MessageType.success);
        await getData();
      } else {
        networkErrorMessage(context);
      }
    } on DioException catch (e) {
      showMessage(
          context: context,
          message: e.response?.data ?? "",
          type: MessageType.error);
    }
  }
}
