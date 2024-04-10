import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class userProvider extends ChangeNotifier {
  String id = "";
  String pw = "";
  int tab = 0;
  String direction = "up";

  void tryLogin(a,b) {
    id = a;
    pw = b;
    notifyListeners();
  }

  void changeTab(i) {
    tab = i;
    notifyListeners();
  }

  void changeDirection(n) {
    direction = n;
    notifyListeners();
  }
}