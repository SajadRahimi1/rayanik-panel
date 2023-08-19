import 'dart:typed_data';

import 'package:dio/dio.dart';

class CreateBookModel {
  String? author, title, publisher, imageFileName, pdfFileName, description, id;
  Uint8List? image, pdf;

  Map<String, dynamic> toJson() => {
        if (image != null)
          'image': MultipartFile.fromBytes(image?.toList() ?? [],
              filename: imageFileName),
        if (pdf != null)
          'pdf': MultipartFile.fromBytes(pdf?.toList() ?? [],
              filename: pdfFileName),
        if (id != null) 'Id': id,
        'author': author,
        'title': title,
        'publisher': publisher,
        'imageFileName': imageFileName,
        'pdfFileName': pdfFileName,
        'description': description
      };
}
