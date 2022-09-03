import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  void playSound(int val){ // Function to play multiple sounds, called inside TextButton()
    final player = AudioPlayer();
    player.play(AssetSource('note$val.wav')); // $val is replaced by val number when code gets executed
  }

  Expanded buildKey({required Color color, required int soundNumber}){
    return Expanded(
      child: TextButton(
        child: Text(''),
        style: TextButton.styleFrom(
          // primary: Colors.black87, // color of text that is over our button NOT IN THIS APP
          elevation: 2,
          backgroundColor: color,
        ),
        onPressed: () { playSound(soundNumber); },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildKey(color: Colors.red, soundNumber: 1),
                buildKey(color: Colors.orange, soundNumber: 2),
                buildKey(color: Colors.yellow, soundNumber: 3),
                buildKey(color: Colors.green, soundNumber: 4),
                buildKey(color: Colors.teal, soundNumber: 5),
                buildKey(color: Colors.blue, soundNumber: 6),
                buildKey(color: Colors.purple, soundNumber: 7),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
