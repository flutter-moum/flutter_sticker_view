import 'package:flutter/material.dart';
import 'dart:math';
import 'package:sticker/sticker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sticker Demo',
      theme: ThemeData(
      ),
      home: MyHomePage(title: 'Flutter Sticker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  List<StickerItem> stickers = [];


  @override
  void initState() {
    super.initState();
    stickers = [
      StickerItem(
          defaultX: 50,
          defaultY: 50,
          child: Image.asset('assets/sticker/apple.png')
      ),
      StickerItem(
          defaultX: 10,
          defaultY: 10,
          child: Image.asset('assets/sticker/bulb.png')
      ),
      StickerItem(
          defaultX: 30,
          defaultY: 30,
          child: Image.asset('assets/sticker/school.png')
      ),
    ];
  }

  _addSticker() {
    setState(() {
      stickers.add(
          StickerItem(defaultX: 50.0+Random().nextInt(100), defaultY: 50.0+Random().nextInt(100), child: Container(color: Colors.amber))
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StickerBoard(
        [Image.asset('assets/sticker/school.png'), Image.asset('assets/sticker/bulb.png'), Image.asset('assets/sticker/apple.png')],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _addSticker,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
