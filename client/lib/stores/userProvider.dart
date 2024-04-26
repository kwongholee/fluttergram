import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UserProvider extends ChangeNotifier {
  var userInfo = {
    "id": "",
    "name": "이광호",
    "introduce": "리팡호 ㅎㅎㅎ"
  };
  String direction = "up";

  void logIn(a) {
    if(userInfo["id"] != "") {
      if(userInfo["id"] != a) return;
    }
    else {
      userInfo["id"] = a;
    }
    notifyListeners();
  }
  void setProfile(a,b,c) {
    userInfo["id"] = a;
    userInfo["name"] = b;
    userInfo["introduce"] = c;
  }
  void changeDirection(n) {
    direction = n;
    notifyListeners();
  }
}