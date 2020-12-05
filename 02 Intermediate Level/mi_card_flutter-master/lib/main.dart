import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('images/my-photo.jpeg'),
            ),
            Text(
              'Ahmad Shaikh',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
              ),
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'UnicaOne',
                letterSpacing: 2.5,
              ),
            ),
            SizedBox(
              width: 250,
              height: 25,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  size: 35,
                  color: Colors.black,
                ),
                title: Text(
                  'Message me in inbox',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'UnicaOne',
                      color: Colors.black),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  size: 35,
                  color: Colors.black,
                ),
                title: Text(
                  'Email Address',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'UnicaOne',
                      color: Colors.black),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.location_pin,
                  size: 35,
                  color: Colors.black,
                ),
                title: Text(
                  'Location',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'UnicaOne',
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
