import 'package:flutter/material.dart';
import 'package:flutter5/notifier.dart';
import 'package:flutter5/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: IsDarkMode,
      builder: (context, boolvalue, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: boolvalue ? Brightness.dark : Brightness.light,
          ),
          home: WelcomePage(),
        );
      },
    );
  }
}
