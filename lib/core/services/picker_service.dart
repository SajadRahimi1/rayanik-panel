import 'package:file_picker/file_picker.dart';

Future<FilePickerResult?> pickFile({int typeIndex = 0}) async {
  FilePickerResult? result = await FilePicker.platform
      .pickFiles(allowCompression: true, type: FileType.values[typeIndex]);
  return result;
}
