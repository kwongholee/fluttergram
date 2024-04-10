import 'package:client/pages/directMessageList.dart';
import 'package:client/pages/home.dart';
import 'package:client/pages/profile.dart';
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
      theme: theme,
      home: const MyApp(),
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
    return context.watch<userProvider>().id == "" || context.watch<userProvider>().pw == "" ? Login()
        : context.watch<userProvider>().tab == 0 ? Home()
        : context.watch<userProvider>().tab == 1 ? Search()
        : context.watch<userProvider>().tab == 2 ? Profile()
        : DirectMessageList();
  }
}