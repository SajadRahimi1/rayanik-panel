import 'package:file_picker/file_picker.dart';

Future<FilePickerResult?> pickFile({int typeIndex = 0,List<String>? allowedExtensions,}) async {
  FilePickerResult? result = await FilePicker.platform
      .pickFiles(allowCompression: true, type: FileType.values[typeIndex],allowedExtensions: allowedExtensions);
  return result;
}
