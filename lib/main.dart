import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro/timer/prefrences.dart';
import 'package:pomodoro/timer/timer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimerPage(),
      routes: {
        '/settings': (context) => Preferences(),
        '/theTimer': (context) => TimerPage(),
      },
    );
  }
}