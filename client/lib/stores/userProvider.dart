import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UserProvider extends ChangeNotifier {
  var userInfo = {
    "id": "",
    "pw": "",
    "name": "이광호",
    "introduce": "리팡호 ㅎㅎㅎ"
  };
  String direction = "up";

  void tryLogin(a,b) {
    if(userInfo["id"] != "" && userInfo["pw"] != "") {
      if(userInfo["id"] != a && userInfo["pw"] != b) return;
    }
    else {
      userInfo["id"] = a;
      userInfo["pw"] = b;
    }
    notifyListeners();
  }
  void setProfile(a,b,c,d) {
    userInfo["id"] = a;
    userInfo["pw"] = b;
    userInfo["name"] = c;
    userInfo["introduce"] = d;
  }
  void changeDirection(n) {
    direction = n;
    notifyListeners();
  }
}