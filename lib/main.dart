import 'package:flutter/material.dart';
import 'package:flutter_basic/provider/album_provider.dart';
import 'package:flutter_basic/screens/alert_dialog_screen.dart';
import 'package:flutter_basic/screens/align_screen.dart';
import 'package:flutter_basic/screens/bottom_nav_screen.dart';
import 'package:flutter_basic/screens/carousel_slider.dart';
import 'package:flutter_basic/screens/flexible_screen.dart';
import 'package:flutter_basic/screens/form/form_screen.dart';
import 'package:flutter_basic/screens/form/success_screen.dart';
import 'package:flutter_basic/screens/gradation_screen.dart';
import 'package:flutter_basic/screens/grid_view_screen.dart';
import 'package:flutter_basic/screens/json_screen.dart';
import 'package:flutter_basic/screens/list_view_pagination.dart';
import 'package:flutter_basic/screens/list_view_screen.dart';
import 'package:flutter_basic/screens/local_notifications_screen.dart';
import 'package:flutter_basic/screens/provider_screen.dart';
import 'package:flutter_basic/screens/refresh_indicator.dart';
import 'package:flutter_basic/screens/scroll_screen.dart';
import 'package:flutter_basic/screens/shared_preferences_screen.dart';
import 'package:flutter_basic/screens/stack_screen.dart';
import 'package:flutter_basic/screens/web_view_screen.dart';
import 'package:flutter_basic/view/albumView.dart';
import 'package:flutter_basic/viewModel/albumViewModel.dart';
import 'package:provider/provider.dart';

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
      home: const CarouselSliderScreen(),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const FormScreen(),
//         '/success': (context) => const SuccessScreen(),
//       },
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: ChangeNotifierProvider<AlbumViewModel>(
//         create: (context) => AlbumViewModel(),
//         child: const AlbumView(),
//       ),
//     );
//   }
// }
