import 'package:client/pages/directmessage/directMessageList.dart';
import 'package:client/pages/directmessage/directMessageRoom.dart';
import 'package:client/pages/feed/addFeed.dart';
import 'package:client/pages/feed/feedDetail.dart';
import 'package:client/pages/home/home.dart';
import 'package:client/pages/userProfile/followList.dart';
import 'package:client/pages/userProfile/profile.dart';
import 'package:client/pages/login/register.dart';
import 'package:client/pages/userProfile/settingProfileEdit.dart';
import 'package:client/pages/userProfile/settings.dart';
import 'package:client/pages/search/search.dart';
import 'package:client/stores/directMessage.dart';
import 'package:client/stores/feedListProvider.dart';
import 'package:client/stores/followProvider.dart';
import 'package:client/styles/main.style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_router/flutter_router.dart' as FRouter;

import './stores/userProvider.dart';
import 'pages/login/login.dart';
import 'widgets/mainPage.dart';
import '../styles/main.style.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (c) => UserProvider()),
      ChangeNotifierProvider(create: (c) => UserFeedListProvider()),
      ChangeNotifierProvider(create: (c) => FollowProvider()),
      ChangeNotifierProvider(create: (c) => DirectMessage())
    ],
    child: MaterialApp(
      onGenerateRoute: FRouter.Router({
        '/feed/detail/{id}': (context, match, settings) {
          String? idString = match!.parameters["id"];
          int id = int.parse(idString!);
          return FeedDetail(id: id);
        },
        '/directmessage/room/{id}': (context, match, settings) => DirectMessageRoom(id: match!.parameters["id"])
      }).get,
      routes: {
        '/': (c) => c.watch<UserProvider>().userInfo["id"] == "" || c.watch<UserProvider>().userInfo["pw"] == "" ? Login() : Home(),
        '/register': (c) => Register(),
        '/feed/add': (c) => AddFeed(),
        '/search': (c) => Search(),
        '/profile': (c) => Profile(),
        '/profile/followlist': (c) => FollowList(),
        '/profile/settings': (c) => Settings(),
        '/profile/settings/modification': (c) => ProfileEdit(),
        '/directmessage/list': (c) => DirectMessageList()
      },
    theme: theme,
  )
  ),);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}