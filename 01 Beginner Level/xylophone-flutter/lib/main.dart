import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void call(int num) {
    final player = AudioCache();
    // call this method when desired
    player.play('note$num.wav');
  }

  Widget buildKey(int num, Color colorGiven) {
    return Expanded(
      child: FlatButton(
          padding: EdgeInsets.all(0),
          color: colorGiven,
          onPressed: () {
            call(num);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(1, Colors.red),
              buildKey(2, Colors.orange),
              buildKey(3, Colors.yellow),
              buildKey(4, Colors.green),
              buildKey(5, Colors.blue),
              buildKey(6, Colors.indigo),
              buildKey(7, Colors.purple),
            ]),
      ),
    ));
  }
}
