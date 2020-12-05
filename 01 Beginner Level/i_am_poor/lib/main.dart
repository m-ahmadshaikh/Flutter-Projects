import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar:
            AppBar(title: Text('I Am Poor'), backgroundColor: Colors.grey[900]),
        body: Center(
          child: Image(
            image: NetworkImage(
                'https://www.clipartmax.com/png/full/233-2336912_the-lump-of-coal-clip-art-coal.png'),
          ),
        ),
      ),
    ));
