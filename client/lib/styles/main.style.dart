import 'package:flutter/material.dart';

var theme = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: 1,
    titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black)
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey
  )
);