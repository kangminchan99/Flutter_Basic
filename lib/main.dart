import 'package:flutter/material.dart';
import 'package:flutter_basic/screens/alert_dialog_screen.dart';
import 'package:flutter_basic/screens/align_screen.dart';
import 'package:flutter_basic/screens/grid_view_screen.dart';
import 'package:flutter_basic/screens/list_view_screen.dart';
import 'package:flutter_basic/screens/scroll_screen.dart';
import 'package:flutter_basic/screens/stack_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AlertDialogScreen(),
    );
  }
}
