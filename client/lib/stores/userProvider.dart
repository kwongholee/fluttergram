import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class userProvider extends ChangeNotifier {
  String id = "";
  String pw = "";
  String name = "이광호";
  String introduce = "리팡호 ㅎㅎ";
  String direction = "up";

  void tryLogin(a,b) {
    id = a;
    pw = b;
    notifyListeners();
  }
  void setProfile(a,b,c,d) {
    id = a;
    pw = b;
    name = c;
    introduce = d;
  }
  void changeDirection(n) {
    direction = n;
    notifyListeners();
  }
}