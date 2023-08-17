import 'dart:convert';

import 'package:rayanik_panel/core/constants/urls.dart';

class BooksModel {
  String? title;
  String? author;
  String? publisher;
  String? downloadUrl;
  dynamic description;
  String? imageUrl;
  String? id;
  String? createdAt;
  String? updatedAt;

  BooksModel(
      {this.title,
      this.author,
      this.publisher,
      this.downloadUrl,
      this.description,
      this.imageUrl,
      this.id,
      this.createdAt,
      this.updatedAt});

  BooksModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    author = json["author"];
    publisher = json["publisher"];
    downloadUrl = json["downloadUrl"];
    description = json["description"];
    imageUrl =
        json["imageUrl"] == null ? null : '$baseUrl/uploads/${json["imageUrl"]}';
    id = json["Id"];
    createdAt = json["CreatedAt"];
    updatedAt = json["UpdatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["author"] = author;
    _data["publisher"] = publisher;
    _data["downloadUrl"] = downloadUrl;
    _data["description"] = description;
    _data["imageUrl"] = imageUrl;
    _data["Id"] = id;
    _data["CreatedAt"] = createdAt;
    _data["UpdatedAt"] = updatedAt;
    return _data;
  }
}
