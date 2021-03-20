import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputDoneView extends StatelessWidget {
  InputDoneView(this.clickable);
  final bool clickable;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: CupertinoButton(
            padding: EdgeInsets.only(right: 24.0, top: 8.0, bottom: 8.0),
            onPressed: clickable  ? () {
              FocusScope.of(context).requestFocus(new FocusNode());
            } : null,
            child: Text(
                "Done",
                style: clickable ? TextStyle(color: Colors.black,fontWeight: FontWeight.bold) : TextStyle(color: Colors.black12)
            ),
          ),
        ),
      ),
    );
  }
}