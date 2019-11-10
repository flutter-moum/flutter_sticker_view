import 'package:flutter/material.dart';

class StickerBoard extends StatelessWidget {

  final List<Widget> children;
  StickerBoard({this.children});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: children
    );
  }
}

class StickerItem extends StatefulWidget {

  double defaultX;
  double defaultY;
  Widget child;

  StickerItem({
    this.defaultX,
    this.defaultY,
    @required this.child
  });

  @override
  _StickerItemState createState() => _StickerItemState(defaultX, defaultY, child);
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
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
              ),
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Container(
                    width: width,
                    height: height,
                    child: child
                ),
                onPanUpdate: (DragUpdateDetails details) {
                  setState(() {
                    x += details.delta.dx;
                    y += details.delta.dy;
                  });
                },
              ),
            ),
          ),
          Positioned(
            child: Align(
              alignment: FractionalOffset.bottomRight,
              child: GestureDetector(
                  onPanUpdate: (DragUpdateDetails details) {
                    setState(() {
                      width += details.delta.dx;
                      height += details.delta.dx;
                    });
                  },
                  child: Container(height: 10.0, width: 10.0, color: Colors.black,)
              ),
            ),
          ),
        ],
      ),

    );
  }
}
