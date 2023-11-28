import 'package:flutter/material.dart';
import 'package:flutter_webtoon_app/screens/home_screen.dart';
import 'package:flutter_webtoon_app/services/api_service.dart';

void main() {
  ApiService().getTodayToons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeScreen(
        ),
    );
  }
}
