import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String dropDownValue = 'PKR';

  DropdownButton getAndroidDropDown() {
    List<DropdownMenuItem> items = [];
    for (String i in currenciesList) {
      items.add(DropdownMenuItem(
        child: Text(i),
        value: i,
      ));
    }
    return DropdownButton(
        value: dropDownValue,
        items: items,
        onChanged: (value) {
          setState(() {
            dropDownValue = value;
            updataUI();
          });
        });
  }

  CupertinoPicker getIOSpicker() {
    List<Text> items = [];
    for (String i in currenciesList) {
      items.add(Text(i));
    }
    return CupertinoPicker(
      onSelectedItemChanged: (int value) {
        print(value);
      },
      itemExtent: 32,
      children: items,
    );
  }

  Widget getDropMenu() {
    if (Platform.isAndroid) {
      return getAndroidDropDown();
    } else if (Platform.isIOS) {
      return getIOSpicker();
    }
  }

  int btc;
  int eth;
  int ltc;
  bool isWaiting = true;
  void updataUI() async {
    try {
      dynamic res = await CoinData().getBTC(dropDownValue);
      dynamic price = res['last'];
      btc = price.toInt();

      res = await CoinData().getETH(dropDownValue);
      price = res['last'];
      eth = price.toInt();

      res = await CoinData().getLTC(dropDownValue);
      price = res['last'];
      ltc = price.toInt();
      isWaiting = false;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updataUI();
  }

  @override
  Widget build(BuildContext context) {
    updataUI();
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          childCard(
              bitCurren: isWaiting ? '?' : btc.toString(),
              dropDownValue: dropDownValue,
              currency: 'BTC'),
          childCard(
              bitCurren: isWaiting ? '?' : eth.toString(),
              dropDownValue: dropDownValue,
              currency: 'ETH'),
          childCard(
              bitCurren: isWaiting ? '?' : ltc.toString(),
              dropDownValue: dropDownValue,
              currency: 'LTC'),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? getIOSpicker() : getAndroidDropDown(),
          ),
        ],
      ),
    );
  }
}

class childCard extends StatelessWidget {
  childCard({
    @required this.bitCurren,
    @required this.dropDownValue,
    @required this.currency,
  });

  final String dropDownValue;
  final String currency;
  final String bitCurren;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $currency = $bitCurren $dropDownValue',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
