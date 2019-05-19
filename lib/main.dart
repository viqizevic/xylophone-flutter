import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Xylophone(),
    );
  }
}

class Xylophone extends StatefulWidget {
  @override
  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  String passCode = '';

  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
    addToCode(soundNumber);
  }

  Expanded buildKey({Color color, int note}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(note);
        },
      ),
    );
  }

  void addToCode(int number) {
    passCode = '$passCode$number';
    checkCode();
    if (8 == number) {
      passCode = '';
    }
  }

  void checkCode() {
    if ('77777' == passCode) {
      playSong();
    }
  }

  void playSong() {
    final player = AudioCache();
    player.play('song1.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildKey(note: 1, color: Colors.red),
            buildKey(note: 2, color: Colors.orange),
            buildKey(note: 3, color: Colors.yellow),
            buildKey(note: 4, color: Colors.green),
            buildKey(note: 5, color: Colors.teal),
            buildKey(note: 6, color: Colors.blue),
            buildKey(note: 7, color: Colors.blue.shade900),
            buildKey(note: 8, color: Colors.purple.shade700),
          ],
        ),
      ),
    );
  }
}
