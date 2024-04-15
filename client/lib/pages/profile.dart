import 'package:client/widgets/profileHeader.dart';
import 'package:flutter/material.dart';
import 'package:client/stores/userProvider.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Page"), actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))]),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: ProfileHeader()),
        SliverGrid(delegate: SliverChildBuilderDelegate((c,i) => Container(child: Image.asset('assets/jiwoo.jpg')), childCount: 4),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3))
      ]),
      bottomNavigationBar: context.watch<userProvider>().direction == "up" ? BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (i) {
          context.read<userProvider>().changeTab(i);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ) : null
    );
  }
}
