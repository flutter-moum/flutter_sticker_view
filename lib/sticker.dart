import 'package:flutter/material.dart';

List<Widget> stickersOnBoard = [];

class StickerBoard extends StatelessWidget {
  final List<Widget> stickerList;

  StickerBoard(this.stickerList) {
    stickersOnBoard.add(StickerMenu(stickerList));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: stickersOnBoard,
    );
  }
}

class StickerItem extends StatefulWidget {
  final double defaultX;
  final double defaultY;
  final Widget child;

  StickerItem({this.defaultX, this.defaultY, @required this.child});

  @override
  _StickerItemState createState() =>
      _StickerItemState(defaultX, defaultY, child);
}

class _StickerItemState extends State<StickerItem> {
  final Widget child;

  double x;
  double y;
  double width = 100.0;
  double height = 100.0;

  _StickerItemState(this.x, this.y, this.child);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: y,
      left: x,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
            ),
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(5.0),
            child: GestureDetector(
              child: Container(width: width, height: height, child: child),
              onPanUpdate: (DragUpdateDetails details) {
                setState(() {
                  x += details.delta.dx;
                  y += details.delta.dy;
                });
              },
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                child: ClipOval(
                  child: Container(
                    width: 13.0,
                    height: 13.0,
                    color: Colors.grey.shade100,
                    child: Icon(Icons.code, size: 10.0,),
                  ),
                ),
                onPanUpdate: (DragUpdateDetails details) {
                double _width = width + details.delta.dx;
                double _height = height + details.delta.dx;
                _width > 10 && _height > 10 ? setState(() {
                  width += details.delta.dx;
                  height += details.delta.dx;
                }) : setState(() {});
              },),
            ),
          ),Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                child: ClipOval(
                  child: Container(
                    width: 13.0,
                    height: 13.0,
                    color: Colors.black,
                    child: Icon(Icons.clear, size: 10.0, color: Colors.white,),
                  ),
                ),
                onPanUpdate: (DragUpdateDetails details) {
                  double _width = width + details.delta.dx;
                  double _height = height + details.delta.dx;
                  _width > 10 && _height > 10 ? setState(() {
                    width += details.delta.dx;
                    height += details.delta.dx;
                  }) : setState(() {});
                },),
            ),
          ),
        ],
      ),
    );
  }
}

class StickerMenu extends StatefulWidget {
  StickerMenu(this.stickerList);
  final List<Widget> stickerList;

  @override
  _StickerMenuState createState() => _StickerMenuState();
}

class _StickerMenuState extends State<StickerMenu> {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.white12,
          height: 120.0,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: widget.stickerList.map((_child) => GestureDetector(child: Padding(padding: EdgeInsets.all(30.0), child: _child,), onTap: (){ setState(() {
                    stickersOnBoard.insert(0, StickerItem(child: _child));
                  });},)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

