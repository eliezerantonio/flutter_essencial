import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Event{


}
class EventBus {
  final _streamController = StreamController<Event>.broadcast();

  Stream<String> get stream => _streamController.stream;

  sendEvent(String event) {
    _streamController.add(event);
  }

  static EventBus get(context) => Provider.of(context, listen: false);

  dispose() {
    _streamController.close();
  }
}
