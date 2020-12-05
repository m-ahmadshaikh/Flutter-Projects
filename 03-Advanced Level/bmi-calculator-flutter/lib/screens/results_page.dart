import 'package:flutter/material.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  final String bmi;
  final String interpertation;
  final String resultText;
  ResultsPage(
      {@required this.bmi,
      @required this.interpertation,
      @required this.resultText});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results Page'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                color: Color(0xFF171829),
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Your Result',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Color(0xFF1A1A2D),
                ),
                margin: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmi,
                      style: TextStyle(
                          fontSize: 70.0, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      interpertation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
              text: 'RECALCULATE',
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ]),
    );
  }
}
