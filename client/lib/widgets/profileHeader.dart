import 'package:flutter/material.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  Image profileImage = Image.asset('assets/jiwoo.jpg');
  var profileInfo = {};

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
      decoration: BoxDecoration(color: Colors.red),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CircleAvatar(radius: 45, backgroundImage: AssetImage('assets/jiwoo.jpg')),
        Container(margin: EdgeInsets.fromLTRB(0, 10, 0, 0), child: Text("이름")),
        Text("소개글")
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
      decoration: BoxDecoration(color: Colors.blue),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text("3"), Text("feeds")],),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text("321"), Text("followers")],),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text("123"), Text("followings")],)
      ]),
    ));
  }
}
