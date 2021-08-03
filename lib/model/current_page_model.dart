import 'package:flutter/material.dart';

class CurrentPage with ChangeNotifier {
  String _currentPage = "";
  List<String> _historyPage = [];

  CurrentPage();

  List<String> get historyPage => _historyPage;
  get getPage => _currentPage;

  void changePage(String name){
    _currentPage = name;
    _historyPage.add(name);
    print(name);
    notifyListeners();
  }
}