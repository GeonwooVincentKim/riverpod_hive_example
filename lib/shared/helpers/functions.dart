import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();
String getRandomString(int length) => String.fromCharCodes(Iterable.generate(length, (_)
  => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

String customDateFormat() {
  DateTime now = DateTime.now();

  String formattedDate = DateFormat('yyyy-MM-dd hh:MM').format(now);
  return formattedDate;
}

String generalDateFormat() {
  DateTime now = DateTime.now();

  String formattedDate = DateFormat('yyyy-MM-dd').format(now);
  return formattedDate;
}
