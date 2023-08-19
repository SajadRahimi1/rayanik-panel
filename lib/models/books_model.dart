import 'package:rayanik_panel/core/constants/urls.dart';
import 'package:rayanik_panel/models/create_book_model.dart';

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
    downloadUrl = json["downloadUrl"] == null
        ? null
        : '$baseUrl/uploads/${json["downloadUrl"]}';
    description = json["description"];
    imageUrl = json["imageUrl"] == null
        ? null
        : '$baseUrl/uploads/${json["imageUrl"]}';
    id = json["Id"];
    createdAt = json["CreatedAt"];
    updatedAt = json["UpdatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["title"] = title;
    data["author"] = author;
    data["publisher"] = publisher;
    data["downloadUrl"] = downloadUrl;
    data["description"] = description;
    data["imageUrl"] = imageUrl;
    data["Id"] = id;
    data["CreatedAt"] = createdAt;
    data["UpdatedAt"] = updatedAt;
    return data;
  }

  CreateBookModel toCreateBookModel() => CreateBookModel()
    ..author = author
    ..description = description
    ..publisher = publisher
    ..title = title;
}
