import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FeedListProvider extends ChangeNotifier {
  var feedList = [
    {
      "writer" : "test",
      "introduce" : "지우 너무 예뻐",
      "like": 12
    },
    {
      "writer" : "test",
      "introduce" : "지우 개예뻐",
      "like": 1001
    },
    {
      "writer" : "test",
      "introduce" : "지우 미친 겁나 예뻐",
      "like": 120000
    }
  ];

  addFeed(a) {
    feedList.insert(0, a);
    notifyListeners();
  }
  editFeed(a, int n) {
    feedList[n]["introduce"] = a;
    notifyListeners();
  }
  setLike(int i, bool d) {
    if(d) {
      // feedList[i]["like"] = feedList[i]["like"]! + 1;
      notifyListeners();
    }
  }
}