import 'dart:developer' as logging show log;

import 'package:flutter/material.dart';

void logger(String message) {
  return logging.log('''
$message
  ''');
}

String getThemeModeString(ThemeMode themeMode) {
  switch (themeMode) {
    case ThemeMode.light:
      return 'Light';

    case ThemeMode.dark:
      return 'Dark';

    default:
      return 'System Theme';
  }
}
