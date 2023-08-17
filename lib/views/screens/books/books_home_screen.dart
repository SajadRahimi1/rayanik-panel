import 'package:flutter/material.dart';
import 'package:rayanik_panel/views/screens/screens_template.dart';

class BooksHomeScreen extends StatelessWidget {
  const BooksHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreensTemplate(selectedItem: 4, title: "مدیریت کتاب ها");
  }
}
