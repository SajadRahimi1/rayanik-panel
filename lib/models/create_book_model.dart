import 'dart:typed_data';

import 'package:dio/dio.dart';

class CreateBookModel {
  String? author, title, publisher, imageFileName, pdfFileName, description;
  Uint8List? image, pdf;

  Map<String, dynamic> toJson() => {
        'image': MultipartFile.fromBytes(image?.toList() ?? [],
            filename: imageFileName),
        'pdf':
            MultipartFile.fromBytes(pdf?.toList() ?? [], filename: pdfFileName),
        'author': author,
        'title': title,
        'publisher': publisher,
        'imageFileName': imageFileName,
        'pdfFileName': pdfFileName,
        'description': description
      };
}
