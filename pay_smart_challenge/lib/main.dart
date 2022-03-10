import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/app_widget.dart';
import 'app/core/inject/inject.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  Inject.initialize();

  runApp(const AppWidget());
}
