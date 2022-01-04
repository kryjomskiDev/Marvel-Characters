import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvel_characters/core/util/dependencies.dart';
import 'package:marvel_characters/core/util/style.dart';

import 'feature/main/presentation/screens/main_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: () => MaterialApp(
        title: 'Marvel Characters',
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: const MainScreen(),
      ),
    );
  }
}
