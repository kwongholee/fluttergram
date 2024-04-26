import 'package:flutter/material.dart';

class FollowProvider extends ChangeNotifier {
  var followingList = [
    {"id": "test2"},
    {"id": "test3"}
  ];
  var followerList = [
    {"id": "test2"},
    {"id": "test3"}
  ];
  String tab = "";

  void changeTab(a) {
    tab = a;
    notifyListeners();
  }
  void addFollowing(a) {
    followingList.add(a);
    notifyListeners();
  }
  void addFollower(a) {
    followerList.add(a);
    notifyListeners();
  }
  void cancelFollowing(n) {
    followingList.removeAt(n);
  }
  void cancelFollwer(n) {
    followerList.removeAt(n);
  }
}