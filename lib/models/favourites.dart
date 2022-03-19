import 'package:flutter/cupertino.dart';

class Favourits extends ChangeNotifier {
  final List<String> _favouriteItems = [];
  // Getter
  List<String> get items => _favouriteItems;

  void add(String itemName) {
    _favouriteItems.add(itemName);
    notifyListeners();
  }

  void remove(String itemName) {
    _favouriteItems.remove(itemName);
    notifyListeners();
  }
}
