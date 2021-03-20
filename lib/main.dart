import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'KeyboardOverlay.dart';


main() {
  runApp(
    MaterialApp(
      home: Content(),
    ),
  );
}

class Content extends StatefulWidget {

  Content({Key key}): super(key: key);



  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  bool clickable = false;
  final myController = TextEditingController();
  FocusNode phoneNumberFocusNode = new FocusNode();
  KeyboardOverlay _keyboardOverlay = new KeyboardOverlay();


  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onShow: () {
        _keyboardOverlay.showOverlay(context);

      },
      onHide: () {
        _keyboardOverlay.removeOverlay();
      },
    );
    myController.addListener(checkLength);
  }

  Function checkLength() {

    if (myController.text.length > 5) {
      setState(() {
        clickable = true;
        _keyboardOverlay.clickable = clickable;
        _keyboardOverlay.removeOverlay();
        _keyboardOverlay.showOverlay(context);

      });
    } else
      setState(() {
        clickable = false;
        _keyboardOverlay.clickable = clickable;
        _keyboardOverlay.removeOverlay();
        _keyboardOverlay.showOverlay(context);

      });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:Text('KeyboardActions'),
      ),
      body:Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                focusNode: phoneNumberFocusNode,
                controller: myController,
                onEditingComplete: () {
                print(context);
              },
                decoration: InputDecoration(
                  hintText: "Input Number",
                ),
              ),
              ElevatedButton(
                onPressed: clickable ?() => checkLength() : null ,
                child: Text('RaisedButton'),
                style: ButtonStyle(backgroundColor: !clickable ? MaterialStateProperty.all<Color>(Colors.black12) : MaterialStateProperty.all<Color>(Colors.red)),
              )
            ]),
          ),
      ));
  }
}