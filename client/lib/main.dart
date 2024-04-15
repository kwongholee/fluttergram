import 'package:client/pages/directMessageList.dart';
import 'package:client/pages/home.dart';
import 'package:client/pages/profile.dart';
import 'package:client/pages/register.dart';
import 'package:client/pages/search.dart';
import 'package:client/styles/main.style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'dart:convert';

import './stores/userProvider.dart';
import './pages/login.dart';
import 'widgets/mainPage.dart';
import '../styles/main.style.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (c) => userProvider(), child: MaterialApp(
      routes: {
        '/': (c) => c.watch<userProvider>().id == "" || c.watch<userProvider>().pw == "" ? Login() : Home(),
        '/register': (c) => Register(),
        '/search': (c) => Search(),
        '/profile': (c) => Profile(),
        '/directmessage/list': (c) => DirectMessageList()
      },
      theme: theme,
    )
  ));
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