import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppState with ChangeNotifier {
  String _dataUrl = "https://reqres.in/api/users?per_page=20";

  AppState();

  String _displayText = "";
  String _jsonResonse = "";
  bool _isFetching = false;

  void setDisplayText(String text) {
    _displayText = text;
    notifyListeners();
  }

  String get getDisplayText => _displayText;

  bool get isFetching => _isFetching;

  Future<void> fetchData() async {
    _isFetching = true;
    notifyListeners();

    var response = await http.get(_dataUrl);
    if (response.statusCode == 200) {
      _jsonResonse = response.body;
    }

    _isFetching = false;
    notifyListeners();
  }

  String get getResponseText => _jsonResonse;

  List<dynamic> getResponseJson() {
    if (_jsonResonse.isNotEmpty) {
      Map<String, dynamic> json = jsonDecode(_jsonResonse);
      // print(json['data']['avatar']);
      return json['data'];
    }
    return null;
  }
}
