import 'package:flutter/material.dart';
import 'package:staggered_view/screens/homepage.dart';
import 'package:staggered_view/screens/photos_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'homepage',
      routes: {
        'homepage': (context) => const HomePage(),
        'photos_page': (context) => const PhotosPage(),
      },
    ),
  );
}
