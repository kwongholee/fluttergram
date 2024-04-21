import 'package:client/stores/feedListProvider.dart';
import 'package:client/widgets/footBar.dart';
import 'package:client/widgets/profileHeader.dart';
import 'package:flutter/material.dart';
import 'package:client/stores/userProvider.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${context.watch<UserProvider>().userInfo["id"]}'s Profile Page"), actions: [IconButton(onPressed: () {Navigator.pushNamed(context, "/profile/settings");}, icon: Icon(Icons.settings))]),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: ProfileHeader()),
        SliverGrid(delegate: SliverChildBuilderDelegate((c,i) =>
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/feed/detail/${i.toString()}");
              },
              child: Container(child: Image.asset('assets/jiwoo.jpg'))
            ),
            childCount: context.watch<UserFeedListProvider>().feedList.length),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3))
      ]),
      bottomNavigationBar: context.watch<UserProvider>().direction == "up" ? FootBar() : null
    );
  }
}
