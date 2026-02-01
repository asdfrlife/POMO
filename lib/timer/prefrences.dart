import 'package:flutter/material.dart';
import 'package:pomodoro/others/core/theme/pomodoro_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro/others/providing.dart';

class Preferences extends ConsumerStatefulWidget {
  const Preferences({super.key});

  @override
  ConsumerState<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends ConsumerState<Preferences> {
  @override
  Widget build(BuildContext context) {
        var multi = ref.watch(multiNotifierProvider);
    return Scaffold(
      backgroundColor: multi.isItDarkMode ?  multi.counter == 0 ? theColorFocus[4] : multi.counter ==1 ? theColorsBreak[4] : theColorlbreak[4] :  multi.counter == 0 ? theColorFocus[0] : multi.counter ==1 ? theColorsBreak[0] : theColorlbreak[0],
      appBar: AppBar(
        backgroundColor: multi.isItDarkMode ?  multi.counter == 0 ? theColorFocus[4] : multi.counter ==1 ? theColorsBreak[4] : theColorlbreak[4] :  multi.counter == 0 ? theColorFocus[0] : multi.counter ==1 ? theColorsBreak[0] : theColorlbreak[0] ,
        automaticallyImplyLeading: false,
        title: Text('Settings', style: TextStyle(
            fontWeight: FontWeight.bold,

          color:  multi.isItDarkMode ? multi.counter == 0 ? theColorFocus[5] : multi.counter ==1 ? theColorsBreak[5] :
          theColorlbreak[5]:multi.counter == 0 ? theColorFocus[1] : multi.counter ==1 ? theColorsBreak[1] :
          theColorlbreak[1]
        )),
        actions: [
          TextButton(onPressed: () {
             Navigator.pushNamed(context, '/theTimer');
          }, child: Text('x' , style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.normal,
            color:  multi.isItDarkMode ? multi.counter == 0 ? theColorFocus[5] : multi.counter ==1 ? theColorsBreak[5] :
            theColorlbreak[5]:multi.counter == 0 ? theColorFocus[1] : multi.counter ==1 ? theColorsBreak[1] :
            theColorlbreak[1]
          ),
          ))
        ],
      ),
      body: Column(
        spacing: 25,
        children: [
          ListTile (
            title: Text('Dark Mode' , style: TextStyle(
                color: multi.isItDarkMode ? multi.counter == 0 ? theColorFocus[5] : multi.counter ==1 ? theColorsBreak[5] :
                theColorlbreak[5]:multi.counter == 0 ? theColorFocus[1] : multi.counter ==1 ? theColorsBreak[1] :
                theColorlbreak[1]  ),),
            trailing: Transform.scale(scale: 0.65,
            child: Switch(value: multi.isItDarkMode, onChanged: (value) {
                 ref.read(multiNotifierProvider.notifier).darkModeToggle();
            },
                activeColor: Colors.black, // Active thumb color
                activeTrackColor: Colors.grey, // Active track color
                inactiveThumbColor: Colors.white
                , // Inactive thumb color
                inactiveTrackColor: Colors.grey[300]
            )
            ),
          ),
    ListTile (
    title: Text('Focus Length' , style: TextStyle(
    color: multi.isItDarkMode ? multi.counter == 0 ? theColorFocus[5] : multi.counter ==1 ? theColorsBreak[5] :
    theColorlbreak[5]:multi.counter == 0 ? theColorFocus[1] : multi.counter ==1 ? theColorsBreak[1] :
    theColorlbreak[1]  ),), ),
         SizedBox(
           width: double.infinity,
           height: 3,
           child: SliderTheme(
             data: SliderTheme.of(context).copyWith(
                 thumbColor: Color(0xFFFFFFF0),
                 activeTrackColor: Colors.white,
                 inactiveTrackColor: CupertinoColors.inactiveGray,
               thumbShape: const RoundSliderThumbShape(
                 enabledThumbRadius: 20
               ),
               trackHeight: 40,
               overlayShape: RoundSliderOverlayShape(
                 overlayRadius: 26)// Samsung-like thickness
             ),
             child:Slider(
    value: ref.read(multiNotifierProvider.notifier).updateSlider(),
    min: 5,
    max: 60,
    divisions: 55,
    label: ' ${ref.read(multiNotifierProvider.notifier).updateSlider().toInt()} min',
    onChanged: (newValue) {
      ref.read(multiNotifierProvider.notifier).updateValue(newValue);
    } ,
    ),

         )

         ),
          ListTile (
            title: Text('Short Break Length' , style: TextStyle(
                color: multi.isItDarkMode ? multi.counter == 0 ? theColorFocus[5] : multi.counter ==1 ? theColorsBreak[5] :
                theColorlbreak[5]:multi.counter == 0 ? theColorFocus[1] : multi.counter ==1 ? theColorsBreak[1] :
                theColorlbreak[1]  ),), ),
          SizedBox(
              width: double.infinity,
              height: 3,
              child: SliderTheme(

                data: SliderTheme.of(context).copyWith(
                    thumbColor: Color(0xFFFFFFF0),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: CupertinoColors.inactiveGray,
                    thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 20
                    ),
                    trackHeight: 40,
                    overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 26)// Samsung-like thickness
                ),
                child:Slider(
                  value: ref.read(multiNotifierProvider.notifier).updateShortSlider(),
                  min: 5,
                  max: 60,
                  divisions: 55,
                  label: '${ref.read(multiNotifierProvider.notifier).updateShortSlider().toInt()} min',
                  onChanged: (newValue) {
                    ref.read(multiNotifierProvider.notifier).updateShortValue(newValue);
                  } ,
                ),

              )

          ),

          ListTile (
            title: Text('Long Break Length' , style: TextStyle(
                color: multi.isItDarkMode ? multi.counter == 0 ? theColorFocus[5] : multi.counter ==1 ? theColorsBreak[5] :
                theColorlbreak[5]:multi.counter == 0 ? theColorFocus[1] : multi.counter ==1 ? theColorsBreak[1] :
                theColorlbreak[1]  ),), ),
          SizedBox(
              width: double.infinity,
              height: 3,
              child: SliderTheme(

                data: SliderTheme.of(context).copyWith(
                  thumbColor: Color(0xFFFFFFF0),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: CupertinoColors.inactiveGray,
                    thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 20
                    ),
                    trackHeight: 40,
                    overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 26)// Samsung-like thickness
                ),
                child:Slider(

                  value: ref.read(multiNotifierProvider.notifier).updateLongSlider(),
                  min: 5,
                  max: 60,
                  divisions: 55,
                  label: '${ref.read(multiNotifierProvider.notifier).updateLongSlider().toInt()} min',
                  onChanged: (newValue) {
                    ref.read(multiNotifierProvider.notifier).updateLongValue(newValue);
                  } ,
                ),

              )

          ),
          ListTile (
            title: Text('Auto Start' , style: TextStyle(
                color: multi.isItDarkMode ? multi.counter == 0 ? theColorFocus[5] : multi.counter ==1 ? theColorsBreak[5] :
                theColorlbreak[5]:multi.counter == 0 ? theColorFocus[1] : multi.counter ==1 ? theColorsBreak[1] :
                theColorlbreak[1]  ),),
            trailing: Transform.scale(scale: 0.65,
                child: Switch(value: multi.autoStart, onChanged: (value) {
                              ref.read(multiNotifierProvider.notifier).autoStart();
                },
                    activeColor: Colors.black, // Active thumb color
                    activeTrackColor: Colors.grey, // Active track color
                    inactiveThumbColor: Colors.white
                    , // Inactive thumb color
                    inactiveTrackColor: Colors.grey[300]
                )
            ),
          ),
        ]
      )
    );
  }
}
