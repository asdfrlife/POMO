import 'package:flutter/foundation.dart';
import 'package:pomodoro/others/Declaration.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'providing.g.dart';
@riverpod
class  multiNotifier extends _$multiNotifier {
  @override
  TheParameters build () {
    return TheParameters(
        autoStart: false,
        weigh: 200,
        isItDarkMode: false,
        shortLength: 5,
        value: 25,
        longLength: 15,
        counter: 0,
        boldness: false,
        isStarted: false,
        theIcon: Icons.play_arrow_rounded,
        fCounter: 0);
  }
  void atFinished() async {
    // Focus → Short Break
    if (state.counter == 0) {
      if (state.autoStart) {
        state = state.copyWith(
          counter: 1,
          isStarted: true,
          theIcon: Icons.pause_rounded,
        );
        if (focusCounter == 3) {
          state = state.copyWith(
            counter: 2,
          );
          playSound();
          focusCounter = 0;
        }
        else {
          state = state.copyWith(
            counter: 1,
          );
          playSound();
          focusCounter++;
        }
        // ✅ let UI rebuild with new duration
        await Future.delayed(const Duration(milliseconds: 300));
        focusController.restart();
      } else {
        state = state.copyWith(
          isStarted: false,
          boldness: false,
          weigh: 200,
          theIcon: Icons.play_arrow_rounded,
        );
        if (focusCounter == 3) {
          state = state.copyWith(
            counter: 2,
          );
          playSound();
          focusCounter = 0;
        }
        else {
          state = state.copyWith(
            counter: 1,
          );
          playSound();
          focusCounter++;
        }
        focusController.restart();
        focusController.pause();

      }
      return;
    }

    // Short Break → Focus
    if (state.counter == 1) {
      if (state.autoStart) {
        state = state.copyWith(
          counter: 0,
          isStarted: true,
          theIcon: Icons.pause_rounded,
        );

        await Future.delayed(const Duration(milliseconds: 200));
        focusController.restart();
        playSound();
      } else {
        state = state.copyWith(
          isStarted: false,
          weigh: 200,
          boldness: false,
          counter: 0,
          theIcon: Icons.play_arrow_rounded,
        );
        focusController.restart();
        focusController.pause();
        playSound();
      }
    }

    if (state.counter == 2) {
      if (state.autoStart) {
        state = state.copyWith(
          counter: 0,
          isStarted: true,
          theIcon: Icons.pause_rounded,
        );
         focusCounter = 0;
        await Future.delayed(const Duration(milliseconds: 200));
        focusController.restart();
        playSound();
      } else {
        state = state.copyWith(
          isStarted: false,
          counter: 0,
          theIcon: Icons.play_arrow_rounded,
        );
        focusController.restart();
        focusController.pause();
        playSound();
      }
    }
  }

  int currentSessionSeconds() {
    if (state.counter == 0) {
      return state.value * 60;
    } else if (state.counter == 1) {
      return state.shortLength * 60;
    } else {
      return state.longLength * 60;
    }
  }

  void theAlert () {
    focusCounter = 0;
   }
   void theChange () {
    if (state.counter == 0)
       {
         state = state.copyWith(
             boldness: false,
             weigh: 200,
             isStarted: false,
             theIcon:Icons.play_arrow_rounded,
             counter: 1
         );
         focusController.restart();
         focusController.pause();
       }
    else if (state.counter == 1) {
      state = state.copyWith(
          boldness: false,
          weigh: 200,
          isStarted: false,
          theIcon:Icons.play_arrow_rounded,
          counter: 2);
      focusController.restart();
      focusController.pause();
    }
     else {
      state = state.copyWith(
          boldness: false,
          weigh: 200,
          isStarted: false,
          theIcon:Icons.play_arrow_rounded,
          counter: 0);
      focusController.restart();
      focusController.pause();
    }

   }
   void stopStart () {
    if (state.isStarted == false) {
      state = state.copyWith(
          boldness: true,
          weigh: 800,
          isStarted: true,
          theIcon: Icons.pause_rounded,
      );
      focusController.restart();
    }
    else {
      state = state.copyWith(
        boldness: false,
        weigh: 200,
        isStarted: false,
        theIcon: Icons.play_arrow_rounded,
      );
      focusController.restart();
      focusController.pause();
    }
   }
   void fastForward () {
     if (state.counter == 0) {
       state = state.copyWith(
           counter:  1,
           boldness: false,
           weigh: 200,
           theIcon: Icons.play_arrow_rounded,
       );
       if (state.autoStart) {
         state = state.copyWith(
             boldness: true,
             isStarted: true,
             theIcon: Icons.pause_rounded,
             weigh: 800
         );
         focusController.restart();
         playSound();
       }
       else {
         state = state.copyWith(isStarted: false);
         focusController.pause();
         playSound();
       }
       playSound();
       focusCounter++;
       if (focusCounter == 4) {

         state = state.copyWith(
             theIcon: Icons.play_arrow_rounded,
             counter: 2,
         );
         if (state.autoStart) {
           state = state.copyWith(
               boldness: true,
               isStarted: true,
               theIcon: Icons.pause_rounded,
               weigh: 800
           );
           focusController.restart();
         }
         else {
           state = state.copyWith(isStarted: false);
           focusController.pause();
         }
         playSound();
         focusCounter = 0;
       }
       else
       {
         state = state.copyWith(counter: 1);
       }
     }
     else if (state.counter == 1) {

       state = state.copyWith(
           boldness: false,
           weigh: 200,
           theIcon: Icons.play_arrow_rounded,
           counter: 0
       );
       if (state.autoStart) {
         state = state.copyWith(
             boldness: true,
             isStarted: true,
             theIcon: Icons.pause_rounded,
             weigh: 800
         );
         focusController.restart();
         playSound();
       }
       else {
         state = state.copyWith(isStarted: false);
         focusController.pause();
         playSound();
       }
     }
     else {

       state = state.copyWith(
           boldness: false,
           weigh: 200,
           theIcon: Icons.play_arrow_rounded,
           counter: 0
       );
       if (state.autoStart) {
         state = state.copyWith(
             boldness: true,
             isStarted: true,
             theIcon: Icons.pause_rounded,
             weigh: 800
         );
         focusController.restart();
         playSound();
       }
       else {
         state = state.copyWith(isStarted: false);
         focusController.pause();
         playSound();
       }
   }
  }
  void stoper () {
    state.copyWith(theIcon: Icons.play_arrow_rounded );
  }
  double updateSlider () {
    double v = state.value.toDouble();
    return v;
  }
  void updateValue (double newValue) {
    state = state.copyWith(value: newValue.toInt());
  }
  double updateShortSlider () {
    double v = state.shortLength.toDouble();
    return v;
  }
  void updateShortValue (double newValue) {
    state = state.copyWith(shortLength: newValue.toInt());
  }
  double updateLongSlider () {
    double v = state.longLength.toDouble();
    return v;
  }
  void updateLongValue (double newValue) {
    state = state.copyWith(longLength: newValue.toInt());
  }
 void darkModeToggle() {
    if (state.isItDarkMode) {
      state = state.copyWith(isItDarkMode: false);
    } else {
      state = state.copyWith(isItDarkMode: true);
    }
 }
  void autoStart () {
    if (state.autoStart) {
      state =  state.copyWith(
          autoStart: false
      );
      print('Auto Start is ${state.autoStart}');
    }
    else {
      state = state.copyWith(
          autoStart: true
      );
      print('Auto Start is ${state.autoStart}');
    }
  }
  void showActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: theColorsBreak[0],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Preferences' , style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings');
                  state = state.copyWith(
                      weigh: 200,
                      theIcon: Icons.play_arrow_rounded,
                      isStarted: false
                  );
                }
            ),
            const SizedBox(height: 60),
          ],
        );
      },
    );
  }
  }
