import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class userProvider extends ChangeNotifier {
  String id = "";
  String pw = "";

  void tryLogin(a,b) {
    id = a;
    pw = b;
    notifyListeners();
  }
}