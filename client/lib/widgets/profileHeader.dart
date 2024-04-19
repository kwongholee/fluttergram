import 'package:client/stores/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  Image profileImage = Image.asset('assets/jiwoo.jpg');

  @override
  Widget build(BuildContext context) {
    return Container(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      RightContainer(),
      LeftContainer()
    ]));
  }
}

class RightContainer extends StatelessWidget {
  const RightContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(flex: 4, child: Container(
      padding: EdgeInsets.all(30),
      height: 200,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CircleAvatar(radius: 45, backgroundImage: AssetImage('assets/jiwoo.jpg')),
        Container(margin: EdgeInsets.fromLTRB(0, 10, 0, 0), child: Text(context.watch<userProvider>().name)),
        Text(context.watch<userProvider>().id)
      ]),
    ));
  }
}


class LeftContainer extends StatelessWidget {
  const LeftContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(flex: 6, child: Container(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text("3"), Text("feeds", style: TextStyle(fontWeight: FontWeight.w700),)],),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text("321"), Text("followers", style: TextStyle(fontWeight: FontWeight.w700),)],),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text("123"), Text("followings", style: TextStyle(fontWeight: FontWeight.w700),)],)
      ]),
    ));
  }
}
