import 'package:cats/presentation/providers/util.dart';
import 'package:flutter/material.dart';
import 'circular_progress_icon_button.dart';

class GetButton<T> extends StatelessWidget {
  final GetData<T> Function(BuildContext context) selectGetData;
  final void Function(BuildContext context) getCall;

  const GetButton({required this.selectGetData, required this.getCall});

  @override
  Widget build(BuildContext context) {
    GetData getData = selectGetData(context);

    switch (getData.state) {
      case CallState.inProgress:
        return CircularProgressIconButton(
          callback: (context) {
            getCall(context);
          },
          iconData: Icons.add,
          progress: true,
        );

      default:
        return CircularProgressIconButton(
          callback: (context) {
            getCall(context);
          },
          iconData: Icons.add,
          progress: false,
        );
    }
  }
}
