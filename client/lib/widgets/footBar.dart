import 'package:client/pages/home/home.dart';
import 'package:client/pages/profile/profile.dart';
import 'package:client/pages/search/search.dart';
import 'package:client/stores/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FootBar extends StatelessWidget {
  const FootBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (i) {
        if(i == 0) {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false,);
        } else if(i == 1) {
          Navigator.pushNamed(context, '/search');
        } else {
          Navigator.pushNamed(context, '/profile');
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
      ],
    );
  }
}
