import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro/others/providing.dart';
import 'package:pomodoro/others/core/theme/pomodoro_colors.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:pomodoro/others/counter_and_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class TimerPage extends ConsumerStatefulWidget {
  const TimerPage({super.key});

  @override
  ConsumerState<TimerPage> createState() => _TimerPageState();
}
class _TimerPageState extends ConsumerState<TimerPage> {

  Widget timerFocus () {
    var Thevalue =  ref.watch(multiNotifierProvider);
    return Countdown(
      seconds: ref.watch(multiNotifierProvider.notifier).currentSessionSeconds(),
      controller: focusController,
      build: (_, double time) {
       // var darkMode = ref.watch(multiNotifierProvider);
        final minutes = (time ~/ 60).toString().padLeft(2, '0');
        final seconds = (time % 60).toStringAsFixed(0).padLeft(2, '0');
        return Container(
          height: 495,         width: 250,
          color: Thevalue.isItDarkMode ? Thevalue.counter == 0 ? theColorFocus[4] : Thevalue.counter ==1 ? theColorsBreak[4] : theColorlbreak[4] :Thevalue.counter == 0 ? theColorFocus[0] : Thevalue.counter ==1 ? theColorsBreak[0] : theColorlbreak[0] ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.contain,
                child:AnimatedDefaultTextStyle(
                    style: TextStyle(
                      fontSize: 256,
                      fontFamily: 'RobotoFlex',
                      color:  Thevalue.isItDarkMode ? Thevalue.counter == 0 ? theColorFocus[5] : Thevalue.counter ==1 ? theColorsBreak[5] :
                      theColorlbreak[5]:Thevalue.counter == 0 ? theColorFocus[1] : Thevalue.counter ==1 ? theColorsBreak[1] :
                      theColorlbreak[1] ,
                      fontWeight: Thevalue.boldness ? FontWeight.bold : null,
                      fontVariations:  [
                        FontVariation('wght', Thevalue.weigh.toDouble()),
                        FontVariation('wdth', 100)
                      ],
                      height: 1.0,
                    ),
                    duration: Duration(milliseconds: 400),
                    child:Text(minutes)
                )
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: AnimatedDefaultTextStyle(
                    style: TextStyle(
                      fontSize: 256,
                      fontFamily: 'RobotoFlex',
                      color:  Thevalue.isItDarkMode ? Thevalue.counter == 0 ?
                      theColorFocus[5] : Thevalue.counter ==1 ? theColorsBreak[5] :
                      theColorlbreak[5]:Thevalue.counter == 0 ?
                      theColorFocus[1] : Thevalue.counter ==1 ? theColorsBreak[1] : theColorlbreak[1] ,
                      fontWeight: Thevalue.boldness ? FontWeight.bold : null,
                      fontVariations:  [
                        FontVariation('wght', Thevalue.weigh.toDouble() ),
                        FontVariation('wdth', 100)
                      ],
                      height: 1.0,
                    ),
                    duration: Duration(milliseconds: 400),
                    child:Text(seconds)
                )
              ),
              Row(
                spacing: 2,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  bool isFilled = index < focusCounter;
                   return Container(
                     width: 10,
                     height: 10,
                     decoration: BoxDecoration(
                         color: Thevalue.isItDarkMode ? isFilled ? Thevalue.counter == 0 ? theColorFocus[5] : Thevalue.counter ==1 ? theColorsBreak[5] :
                         theColorlbreak[5] : Thevalue.counter == 0 ? theColorFocus[4] :
                         Thevalue.counter ==1 ? theColorsBreak[4] : theColorlbreak[4]: isFilled ? Thevalue.counter == 0 ? theColorFocus[1] : Thevalue.counter ==1 ? theColorsBreak[1] :
                         theColorlbreak[1] : Thevalue.counter == 0 ? theColorFocus[0] :
                     Thevalue.counter ==1 ? theColorsBreak[0] : theColorlbreak[0],
                         borderRadius: BorderRadius.circular(10),
                       border: Border.all(
                         color: Thevalue.isItDarkMode ? Thevalue.counter == 0 ? theColorFocus[5] :
                         Thevalue.counter ==1 ? theColorsBreak[5] : theColorlbreak[5]:Thevalue.counter == 0 ? theColorFocus[1] :
                         Thevalue.counter ==1 ? theColorsBreak[1] : theColorlbreak[1],
                         width: 2

                       )

                     ),
                   );
                }
              ),
              ) ],
          ),
        );
      },
      onFinished: () async {
        await Future.delayed(const Duration(milliseconds: 200));
        ref.read(multiNotifierProvider.notifier).atFinished();
      },
    );
  }
  @override
  Widget build(BuildContext context) {
        var darkMode = ref.watch(multiNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: darkMode.isItDarkMode ?  darkMode.counter == 0 ? theColorFocus[4] :
        darkMode.counter ==1 ? theColorsBreak[4] : theColorlbreak[4] :
        darkMode.counter == 0 ? theColorFocus[0] : darkMode.counter ==1 ? theColorsBreak[0] : theColorlbreak[0],
        actions: [
          IconButton(onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: darkMode.counter == 0 ? theColorFocus[0] : darkMode.counter ==1 ? theColorsBreak[0] : theColorlbreak[0],
                    title: Text('POMO', style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold),),
                    content: Text('are you sure you want to reset the session ?', style: TextStyle(color: Colors.black),),
                    actions: [
                      Row(
                        children: [
                          TextButton(onPressed: () {
                            Navigator.of(context).pop();
                          }, child: Text('Cancel') ,),
                          TextButton(onPressed: () {
                            setState(() {
                              ref.watch(multiNotifierProvider.notifier).theAlert();
                            });
                            Navigator.of(context).pop();
                          }, child: Text('Ok'))
                        ],
                      )
                    ],
                  );});
          }, icon: Icon(Icons.restart_alt_rounded, size: 30, color: darkMode.isItDarkMode ? darkMode.counter == 0 ? theColorFocus[5] : darkMode.counter ==1 ? theColorsBreak[5] :
          theColorlbreak[5]:darkMode.counter == 0 ? theColorFocus[1] : darkMode.counter ==1 ? theColorsBreak[1] :
          theColorlbreak[1]),)
        ],
      ),
      backgroundColor: darkMode.isItDarkMode ?  darkMode.counter == 0 ? theColorFocus[4] :
      darkMode.counter ==1 ? theColorsBreak[4] : theColorlbreak[4] :
      darkMode.counter == 0 ? theColorFocus[0] : darkMode.counter ==1 ? theColorsBreak[0] : theColorlbreak[0],
      body:  Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                ref.read(multiNotifierProvider.notifier).theChange();
              },
              child: AnimatedContainer(duration: Duration(milliseconds: 400),
                width: darkMode.counter == 0 ? 120 : 140,
                height: 48,
                decoration: BoxDecoration(
                  color: darkMode.isItDarkMode ?  darkMode.counter == 0 ? theColorFocus[7] :
                  darkMode.counter ==1 ? theColorsBreak[7] : theColorlbreak[7]:
                  darkMode.counter == 0 ? theColorFocus[3] : darkMode.counter ==1 ? theColorsBreak[3] : theColorlbreak[3],
                  border: Border.all(
                     color:  darkMode.isItDarkMode ? darkMode.counter == 0 ? theColorFocus[5] :
                     darkMode.counter ==1 ? theColorsBreak[5] : theColorlbreak[5] : darkMode.counter == 0 ? theColorFocus[1]
                         : darkMode.counter ==1 ? theColorsBreak[1] : theColorlbreak[1],
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(32)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Icon(darkMode.sessionIcon[darkMode.counter], color: darkMode.isItDarkMode ?
                    darkMode.counter == 0 ? theColorFocus[0] : darkMode.counter ==1 ? theColorsBreak[0] : theColorlbreak[0] :
                    darkMode.counter == 0 ? theColorFocus[1] : darkMode.counter ==1 ? theColorsBreak[1] : theColorlbreak[1],),
                    AnimatedDefaultTextStyle(
                        style:  TextStyle(
                        color: darkMode.isItDarkMode ? darkMode.counter == 0 ? theColorFocus[5] : darkMode.counter ==1 ? theColorsBreak[5] : theColorlbreak[5] :
                        darkMode.counter == 0 ? theColorFocus[1] : darkMode.counter ==1 ? theColorsBreak[1] : theColorlbreak[1],
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoFlex',
                        fontSize: 20
                    ),
                        duration: Duration(milliseconds: 400),
                        child: Text(darkMode.sessionName[darkMode.counter], )

                    )
                  ],
                ),
              )
            ),
            timerFocus(),

            Row(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(duration: Duration (milliseconds: 400),
                    height: 70,
                    width:70,
                    decoration: BoxDecoration(
                        color: darkMode.isItDarkMode ? darkMode.counter == 0 ? theColorFocus[7] :
                        darkMode.counter ==1 ? theColorsBreak[7] : theColorlbreak[7]: darkMode.counter == 0 ?
                        theColorFocus[3] : darkMode.counter ==1 ? theColorsBreak[3] : theColorlbreak[3],
                        borderRadius: BorderRadius.circular(20)

                    ),
                    child: IconButton(onPressed: () {
                      ref.read(multiNotifierProvider.notifier).showActionSheet(context);
                    }
                    , icon: Icon(Icons.more_horiz,color: darkMode.isItDarkMode ?
                        darkMode.counter == 0 ? theColorFocus[5] : darkMode.counter ==1 ? theColorsBreak[5] :
                        theColorlbreak[5]: darkMode.counter == 0 ? theColorFocus[1] : darkMode.counter ==1 ? theColorsBreak[1] :
                        theColorlbreak[1], size: 40,))
                ),
                   AnimatedContainer(duration: Duration(milliseconds: 400),
                     height: 96,
                     width: 125,
                     decoration: BoxDecoration(
                         color: darkMode.isItDarkMode ? darkMode.counter == 0 ? theColorFocus[6] : darkMode.counter ==1 ?
                         theColorsBreak[6] : theColorlbreak[6]:darkMode.counter == 0 ? theColorFocus[2] : darkMode.counter ==1 ? theColorsBreak[2] : theColorlbreak[2],
                         borderRadius: BorderRadius.circular(32)
                     ),
                     child: Center(
                       child: IconButton(onPressed: () {
                                ref.read(multiNotifierProvider.notifier).stopStart();
                       },
                           icon: Icon(darkMode.theIcon,
                             size: 60,
                             color:darkMode.isItDarkMode ?  darkMode.counter == 0 ? theColorFocus[5] :
                             darkMode.counter ==1 ? theColorsBreak[5] : theColorlbreak[5]: darkMode.counter == 0 ? theColorFocus[1] :
                             darkMode.counter ==1 ? theColorsBreak[1] : theColorlbreak[1],)
                       ),
                     )
                 ),
                AnimatedContainer(duration: Duration (milliseconds: 200),
                  height: 70,
                  width:70,
                  decoration: BoxDecoration(
                    color: darkMode.isItDarkMode ? darkMode.counter == 0 ?
                    theColorFocus[7] : darkMode.counter ==1 ? theColorsBreak[7] : theColorlbreak[7] :
                    darkMode.counter == 0 ? theColorFocus[3] : darkMode.counter ==1 ? theColorsBreak[3] : theColorlbreak[3],
                    borderRadius: BorderRadius.circular(20)

                  ),
                  child: IconButton(onPressed: () {
                    ref.read(multiNotifierProvider.notifier).fastForward();
                  },
                      icon: Icon(Icons.fast_forward_rounded,color: darkMode.isItDarkMode ? darkMode.counter == 0 ? theColorFocus[5]
                          : darkMode.counter ==1 ? theColorsBreak[5] : theColorlbreak[5] : darkMode.counter == 0 ? theColorFocus[1] : darkMode.counter ==1 ? theColorsBreak[1] : theColorlbreak[1], size: 40,))
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}