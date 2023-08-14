import 'package:flutter/material.dart';
import 'package:rayanik_panel/views/screens/screens_template.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreensTemplate(selectedItem: 1, title: "مدیریت کاربران");
  }
}
