import 'package:client/stores/feedListProvider.dart';
import 'package:client/widgets/footBar.dart';
import 'package:client/widgets/profileHeader.dart';
import 'package:flutter/material.dart';
import 'package:client/stores/userProvider.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key, this.user}) : super(key: key);
  final user;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final dio = Dio();
  bool loading = true;
  var feedList = [];
  var userInfo = {};

  getFeedList() async {
    final response = await dio.get('http://192.168.35.50:8080/info/feed/user?userId=${widget.user.toString()}');
    setState(() {
      feedList = response.data;
      loading = false;
    });
  }

  getUserInfo() async {
    final response = await dio.get('http://192.168.35.50:8080/info/user?id=${widget.user.toString()}');
    setState(() {
      userInfo = response.data;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
    getFeedList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.user.toString()}'s Profile Page"), actions: [IconButton(onPressed: () {Navigator.pushNamed(context, "/profile/settings");}, icon: Icon(Icons.settings))]),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: ProfileHeader(feedNum: feedList.length, userInfo: userInfo)),
        SliverGrid(delegate: SliverChildBuilderDelegate((c,i) =>
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/feed/detail/${feedList[i]["_id"].toString()}");
              },
              child: Container(child: Image.asset('assets/jiwoo.jpg'))
            ),
            childCount: loading ? 0 : feedList.length),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3))
      ]),
      bottomNavigationBar: context.watch<UserProvider>().direction == "up" ? FootBar() : null
    );
  }
}
