import 'package:chat_rept/blocs/chatBloc.dart';
import 'package:chat_rept/screens/course_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/chat_page.dart';
import 'screens/meow_ui.dart';
import 'screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skul Chat',
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      routes: {
        '/register': (context) => RegisterUi(),
        '/login': (context) => LoginUi(),
        '/course': (context) => CoursePage(title: "Courses"),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFAAAAFF)),
        useMaterial3: true,
      ),
      home: RegisterUi(),
    );
  }
}
