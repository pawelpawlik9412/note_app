import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SharedPref {

  SharedPref({@required this.instanceName, @required this.defaultValue});

  String instanceName;
  String defaultValue;

  read() async {
    final prefs = await SharedPreferences.getInstance();
    var x = prefs.getString(instanceName);
    if (x == null) {
      return defaultValue;
    }
    return x;
  }

  save(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(instanceName, value);
  }

  remove() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(instanceName);
  }
}