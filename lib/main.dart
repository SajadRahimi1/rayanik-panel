import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rayanik_panel/views/screens/books/books_home_screen.dart';
import 'package:rayanik_panel/views/screens/main_screen.dart';
import 'package:rayanik_panel/views/screens/users/users_screen.dart';
import 'package:rayanik_panel/views/screens/video/video_screen.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
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
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/courses': (context) => const VideoScreen(),
        '/users': (context) => const UsersScreen(),
        '/books':(context)=>const BooksHomeScreen()
      },
      builder: (context, child) => Directionality(
          textDirection: TextDirection.rtl, child: child ?? const SizedBox()),
      // home: const MainScreen());
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
