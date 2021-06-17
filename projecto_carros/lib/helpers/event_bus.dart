import 'dart:async';

import 'package:flutter/material.dart';

class EventBus extends ChangeNotifier {
  final _streamController = StreamController<String>.broadcast();

  Stream<String> get stream => _streamController.stream;

  sendEvent(String event) {
    _streamController.add(event);
  }

  dispose() {
    _streamController.close();
  }
}
