import 'package:flutter/material.dart';

enum BaseViewState { Idle, Busy, Error }

class BaseChangeNotifierModel extends ChangeNotifier {
  BaseViewState _state = BaseViewState.Idle;

  BaseViewState get state => _state;

  void setState(BaseViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
