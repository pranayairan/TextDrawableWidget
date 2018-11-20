library text_drawable_widget;

import 'package:flutter/material.dart';

import 'color_generator.dart';

class TextDrawableWidget extends StatefulWidget {
  String text;
  final double width;
  final double height;
  final BoxShape shape;
  BorderRadiusGeometry borderRadius;
  final TextStyle textStyle;
  ColorGenerator colorGenerator;
  final Function onTap;
  final bool isTappable;

  TextDrawableWidget(this.text, this.colorGenerator, this.onTap,
      [this.isTappable = true,
      this.width = 60.0,
      this.height = 60.0,
      this.shape = BoxShape.circle,
      this.textStyle = const TextStyle(color: Colors.white, fontSize: 28.0)]) {
    if (text.length > 1) {
      text = text.substring(0, 1);
    }

    if (shape == BoxShape.rectangle) {
      borderRadius = BorderRadius.all(Radius.circular(5.0));
    }
  }

  @override
  State<StatefulWidget> createState() {
    return _TextDrawableWidgetState(colorGenerator.getRandomColor());
  }
}

class _TextDrawableWidgetState extends State<TextDrawableWidget> {
  int rotationStatus = 0; // 0 means no rotation, 1 gets selected
  final Color backgroundColor;

  _TextDrawableWidgetState(this.backgroundColor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isTappable) {
          rotationStatus == 0 ? widget.onTap(true) : widget.onTap(false);

          setState(() {
            // change the ui
            if (rotationStatus == 0) {
              rotationStatus = 1;
            } else {
              rotationStatus = 0;
            }
          });
        }
      },
      child: rotationStatus == 0 ? _getUnSelected() : _getSelected(),
    );
  }

  Widget _getUnSelected() {
    return new Stack(
      children: <Widget>[
        Container(
          width: widget.width,
          height: widget.height,
          decoration: new BoxDecoration(
            borderRadius: widget.borderRadius,
            color: backgroundColor,
            shape: widget.shape,
          ),
        ),
        Container(
          alignment: Alignment(0.0, 0.0),
          width: widget.width,
          height: widget.height,
          child: Text(
            widget.text,
            style: widget.textStyle,
          ),
        )
      ],
    );
  }

  Widget _getSelected() {
    return new Stack(
      children: <Widget>[
        Container(
          width: widget.width,
          height: widget.height,
          decoration: new BoxDecoration(
            borderRadius: widget.borderRadius,
            color: Colors.grey.shade600,
            shape: widget.shape,
          ),
        ),
        Container(
          alignment: Alignment(0.0, 0.0),
          width: widget.width,
          height: widget.height,
          child: Icon(
            Icons.check,
            size: 32.0,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
