import 'package:flutter/material.dart';

import 'InputDoneView.dart';

class KeyboardOverlay {
  KeyboardOverlay({this.clickable});
  bool clickable = true;
  OverlayEntry _overlayEntry;


  showOverlay(BuildContext context) {
    if (_overlayEntry != null) return;
    OverlayState overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          right: 0.0,
          left: 0.0,
          child:InputDoneView(clickable));
    });

    overlayState.insert(_overlayEntry);
  }
  removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry.remove();
      _overlayEntry = null;
    }
  }
}