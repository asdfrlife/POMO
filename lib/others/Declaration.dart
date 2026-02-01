import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
final CountdownController focusController = CountdownController();
IconData theIcon2 = FontAwesomeIcons.brain;
int focusCounter = 0;
List<String> theThree = ['Focus' , 'Short Break' , 'Long Break'];
List<IconData> session = [FontAwesomeIcons.brain , Icons.emoji_food_beverage,Icons.emoji_food_beverage];
AudioPlayer player = AudioPlayer();
void playSound() {
   player.play(AssetSource('Sounds/notification-bell.wav'));
}
List<Color> theColorFocus = [
   Color(0xFFFFF2F2),
   Color(0xff471515) ,
   Color(0xffFF4C4C) ,
   Color(0xffFFD9D9),
   Color(0xff000000),
   Color(0xffFFF2F2),
   Color(0xffA33131),
   Color(0xff471515),];
List<Color> theColorsBreak = [
   Color(0xFFF2FFF5),
   Color(0xFF14401D),
   Color(0xff89e89e),
   Color(0xFFD9FAE1),
   Color(0xff000000),
   Color(0xffF2FFF5),
   Color(0xff2E8C43),
   Color(0xff14401D),
];
List<Color> theColorlbreak = [
   Color(0xffF2F9FF),
   Color(0xff153047),
   Color(0xff61acf1),
   Color(0xffD9EEFF),
   Color(0xff000000),
   Color(0xffF2F9FF),
   Color(0xff316EA3),
   Color(0xff153047),
];
class TheParameters {
    TheParameters({
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

