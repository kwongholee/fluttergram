import 'package:client/pages/directmessage/directMessageList.dart';
import 'package:client/pages/feed/addFeed.dart';
import 'package:client/pages/home/home.dart';
import 'package:client/pages/profile/profile.dart';
import 'package:client/pages/login/register.dart';
import 'package:client/pages/profile/settingProfileEdit.dart';
import 'package:client/pages/profile/settings.dart';
import 'package:client/pages/search/search.dart';
import 'package:client/stores/feedListProvider.dart';
import 'package:client/styles/main.style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'dart:convert';

import './stores/userProvider.dart';
import 'pages/login/login.dart';
import 'widgets/mainPage.dart';
import '../styles/main.style.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (c) => userProvider()),
      ChangeNotifierProvider(create: (c) => FeedListProvider())
    ],
    child: MaterialApp(
    routes: {
      '/': (c) => c.watch<userProvider>().id == "" || c.watch<userProvider>().pw == "" ? Login() : Home(),
      '/register': (c) => Register(),
      '/feed/add': (c) => AddFeed(),
      '/search': (c) => Search(),
      '/profile': (c) => Profile(),
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