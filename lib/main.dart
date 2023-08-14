import 'package:flutter/material.dart';
import 'package:rayanik_panel/views/screens/main_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Sans",
        ),
        builder: (context, child) => Directionality(
            textDirection: TextDirection.rtl, child: child ?? const SizedBox()),
        home: const MainScreen());
  }
}
