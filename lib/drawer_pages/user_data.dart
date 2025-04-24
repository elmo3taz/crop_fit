import 'package:flutter/foundation.dart';



class UserData extends ChangeNotifier {
  String _name = "John Doe";
  String _phone = "+1 234 567 8901";
  String? _imagePath;

  String get name => _name;
  String get phone => _phone;
  String? get imagePath => _imagePath;

  void updateUser(String name, String phone) {
    _name = name;
    _phone = phone;
    notifyListeners();
  }

  void updateImage(String path) {
    _imagePath = path;
    notifyListeners();
  }
}
