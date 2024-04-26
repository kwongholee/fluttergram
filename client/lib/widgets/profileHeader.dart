import 'package:client/stores/feedListProvider.dart';
import 'package:client/stores/followProvider.dart';
import 'package:client/stores/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({Key? key, this.feedNum, this.userInfo}) : super(key: key);
  final feedNum;
  final userInfo;

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  Image profileImage = Image.asset('assets/jiwoo.jpg');

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          LeftContainer(info: widget.userInfo),
          RightContainer(num: widget.feedNum)
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ElevatedButton(onPressed: () {}, child: Text("Follow"))
        ])
      ],
    ));
  }
}

class LeftContainer extends StatelessWidget {
  const LeftContainer({Key? key, this.info}) : super(key: key);
  final info;

  @override
  Widget build(BuildContext context) {
    return Flexible(flex: 4, child: Container(
      padding: EdgeInsets.all(30),
      height: 200,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CircleAvatar(radius: 45, backgroundImage: AssetImage('assets/jiwoo.jpg')),
        Container(margin: EdgeInsets.fromLTRB(0, 10, 0, 0), child: Text(info["name"].toString())),
        Text(info["introduce"].toString(), style: TextStyle(fontSize: 10),)
      ]),
    ));
  }
}


class RightContainer extends StatelessWidget {
  const RightContainer({Key? key, this.num}) : super(key: key);
  final num;

  @override
  Widget build(BuildContext context) {
    return Flexible(flex: 6, child: Container(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text("${num}"), Text("feeds", style: TextStyle(fontWeight: FontWeight.w700),)],),
        InkWell(
          onTap: () {
            context.read<FollowProvider>().changeTab("follower");
            Navigator.pushNamed(context, "/profile/followlist");
          },
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("${context.watch<FollowProvider>().followerList.length}"),
            Text("followers", style: TextStyle(fontWeight: FontWeight.w700),)
          ],),
        ),
        InkWell(
          onTap: () {
            context.read<FollowProvider>().changeTab("following");
            Navigator.pushNamed(context, "/profile/followlist");
          },
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("${context.watch<FollowProvider>().followingList.length}"),
            Text("followings", style: TextStyle(fontWeight: FontWeight.w700),)
          ],)
        )
      ]),
    ));
  }
}
