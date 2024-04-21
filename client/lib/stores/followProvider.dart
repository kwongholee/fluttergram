import 'package:flutter/material.dart';

class FollowProvider extends ChangeNotifier {
  var followingList = [
    {"id": "i_gogh_03"},
    {"id": "test1"},
    {"id": "test2"}
  ];
  var followerList = [
    {"id": "i_gogh_03"},
    {"id": "test3"},
    {"id": "test4"}
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