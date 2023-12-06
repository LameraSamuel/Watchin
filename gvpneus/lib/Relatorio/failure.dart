import 'package:flutter/material.dart';

class Failure implements Exception {
  final String? msg;
  final String? label;
  final dynamic exception;
  StackTrace? stackTrace;
  Failure({this.msg, this.exception, this.label, this.stackTrace}) {
    if (stackTrace != null) {
      debugPrintStack(label: msg, stackTrace: stackTrace);
    }
  }
}
