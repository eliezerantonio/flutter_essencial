import 'dart:async';

class EventBus {
  final _streamController = StreamController<String>();

  Stream<String> get stream => _streamController.stream;

  sendEvent(String event) {
    _streamController.add(event);
  }

  dispose() {
    _streamController.close();
  }
}
