import 'package:flutter/material.dart';
class TheParameters {
  TheParameters({
    required this.sessionName,
    required this.sessionIcon,
    required this.autoStart,
    required this.weigh,
    required this.isItDarkMode,
    required this.shortLength,
    required this.value,
    required this.longLength,
    required this.counter,
    required this.boldness,
    required this.isStarted,
    required this.theIcon,
    required this.fCounter,
  });
  final List<String> sessionName;
  final List<IconData> sessionIcon;
  final bool autoStart;
  final int weigh;
  final int counter;
  final bool boldness;
  final bool isStarted;
  final IconData theIcon;
  final int fCounter;
  final bool isItDarkMode;
  final int shortLength;
  final int value;
  final int longLength;

  TheParameters copyWith({
    List<String> ? sessionName,
    List<IconData> ? sessionIcon,
    bool? autoStart,
    int? weigh,
    int? counter,
    bool? boldness,
    bool? isStarted,
    IconData? theIcon,
    int? fCounter,
    bool? isItDarkMode,
    int? shortLength,
    int? value,
    int? longLength,
  }) {
    return TheParameters(
      sessionName: sessionName ?? this.sessionName,
      sessionIcon: sessionIcon ?? this.sessionIcon,
      autoStart: autoStart ?? this.autoStart,
      weigh: weigh ?? this.weigh,
      counter: counter ?? this.counter,
      fCounter: fCounter ?? this.fCounter,
      boldness: boldness ?? this.boldness,
      longLength: longLength ?? this.longLength,
      isItDarkMode: isItDarkMode ?? this.isItDarkMode,
      shortLength: shortLength ?? this.shortLength,
      value: value ?? this.value,
      isStarted: isStarted ?? this.isStarted,
      theIcon: theIcon ?? this.theIcon,
    );
  }
}

