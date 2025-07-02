import 'package:flutter/material.dart';
import 'package:lifelab_pages/presentation/school_leaderboard.dart';
import 'package:lifelab_pages/presentation/teacher_leaderboard.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SchoolLeaderboardScreen(),
    );
  }
}
