import 'package:flutter/material.dart';
import 'package:rayanik_panel/views/widgets/menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Menu(selectedItem: -1);
  }
}
