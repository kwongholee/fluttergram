import 'package:flutter/material.dart';

class DirectMessage extends ChangeNotifier {
  var chat = [
    {"chatroom": "1", "writer": "test2", "message": "hello"},
    {"chatroom": "1", "writer": "test", "message": "hi"}
  ];

  addChat(a) {
    chat.insert(0, a);
    notifyListeners();
  }
  getChat(a) {
    for(int i = 0; i < a.length; i++) {
      chat.add(a[i]);
    }
    notifyListeners();
  }
}