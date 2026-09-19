import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/form_screen.dart';
import 'screens/image_grid_screen.dart';
import 'screens/animation_screen.dart';

void main() {
  runApp(const FlutterConceptsApp());
}

class FlutterConceptsApp extends StatelessWidget {
  const FlutterConceptsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Concepts Demo',
      // ThemeData configuring global colors and the custom font family
      theme: ThemeData(
        fontFamily: 'DemoFont',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
        ),
      ),
      // Named routes configuration as required by the assignment
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/form': (context) => const FormScreen(),
        '/images': (context) => const ImageGridScreen(),
        '/animation': (context) => const AnimationScreen(),
      },
    );
  }
}
