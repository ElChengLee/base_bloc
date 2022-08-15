import 'package:bloc_base_source/feature/app/view/app.dart';
import 'package:flutter/material.dart';

import 'di/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(App());
}
