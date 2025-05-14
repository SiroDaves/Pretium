import 'package:flutter/material.dart';

import 'app.dart';
import 'core/di/injectable.dart';

Future<void> main() async {
  await configureDependencies('debug');

  runApp(const MyApp());
}
