// 🐦 Flutter imports:

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class DateTimeUtil {
  static String dMEEE(DateTime dateTime, Locale locale) {
    return DateFormat("d MMMM, EEE", locale.toString()).format(dateTime);
  }

  static String dm(DateTime dateTime, Locale locale) {
    return DateFormat("dd/MM", locale.toString()).format(dateTime);
  }

  static String addZero(int data) {
    return data.toString().padLeft(2, '0');
  }

  static String hhmm(DateTime dateTime, Locale locale) {
    return DateFormat("HH:mm", locale.toString()).format(dateTime);
  }
}
