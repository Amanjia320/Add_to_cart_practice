// // ignore_for_file: prefer_final_fields, non_constant_identifier_names, unused_local_variable

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class CartProvider with ChangeNotifier {
//   int _counter = 0;
//   int get counter => _counter;

//   double _totalPrice = 0.0;
//   double get totalPrice => _totalPrice;

//   // ignore: unused_element
//   void _setPrefsItems() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     prefs.setInt('cart_item', _counter);
//     prefs.setDouble('total_Price', _totalPrice);
//     notifyListeners();
//   }

//   // ignore: unused_element
//   void _getPrefsItems() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     _counter = prefs.getInt('cart_item') ?? 0;
//     _totalPrice = prefs.getDouble('total_Price') ?? 0.0;
//     notifyListeners();
//   }

//   void addTotalPrice(double productprice) {
//     _totalPrice = _totalPrice + productprice;
//     _setPrefsItems();
//     notifyListeners();
//   }

//   void removerTotalPrice(double productprice) {
//     _totalPrice = _totalPrice - productprice;
//     _setPrefsItems();
//     notifyListeners();
//   }

//   double getTotalPrice() {
//     _getPrefsItems();
//     return _totalPrice;
//   }

//   void addCounter() {
//     _counter++;
//     _setPrefsItems();
//     notifyListeners();
//   }

//   void removerCounter() {
//     _counter--;
//     _setPrefsItems();
//     notifyListeners();
//   }

//   int getCounter() {
//     _getPrefsItems();
//     return _counter;
//   }
// }

import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _isDarkMode = false;

  // Getter to check current theme mode
  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  // Method to toggle between light and dark themes
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners(); // Notify listeners to update the UI
  }
}
