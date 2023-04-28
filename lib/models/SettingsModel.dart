import 'package:flutter/material.dart';

class SettingsModel {
  static bool _isNotificationsAllowed = true;
  static double _version = 3.2;
  static String _displayLanguage = "English";
  //GETTER
  static bool get isNotificationsAllowed => _isNotificationsAllowed;
  static double get version => _version;
  static String get displayLanguage => _displayLanguage;
  
}
