import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get count => _counter;

  void increment() {
    _counter += 1;
    notifyListeners(); // setState((){}) for provider, notify all the listeners about the changes made.
  }
}
