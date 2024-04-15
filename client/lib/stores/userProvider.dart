import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class userProvider extends ChangeNotifier {
  String id = "";
  String pw = "";
  String direction = "up";

  void tryLogin(a,b) {
    id = a;
    pw = b;
    notifyListeners();
  }

  void changeDirection(n) {
    direction = n;
    notifyListeners();
  }
}