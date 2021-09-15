import 'package:flutter/material.dart';

class CircularProgressIconButton extends StatelessWidget {
  final double iconAndProgressSize = 25;
  final double buttonPadding = 20;
  final double progressStrokeWidth = 2;

  final void Function(BuildContext) callback;
  final IconData iconData;
  final bool progress;

  const CircularProgressIconButton(
      {required this.callback, required this.iconData, required this.progress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback(context);
      },
      child: progress
          ? Container(
              width: iconAndProgressSize,
              height: iconAndProgressSize,
              decoration: new BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                strokeWidth: progressStrokeWidth,
                color: Colors.white,
              ),
            )
          : Icon(
              iconData,
              size: iconAndProgressSize,
            ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(CircleBorder()),
        padding: MaterialStateProperty.all(EdgeInsets.all(buttonPadding)),
        backgroundColor: MaterialStateProperty.all(
            Colors.deepOrange.shade500), // <-- Button color
      ),
    );
  }
}
