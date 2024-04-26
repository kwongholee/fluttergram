import 'package:client/stores/followProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FollowList extends StatelessWidget {
  const FollowList({Key? key, this.user}) : super(key: key);
  final user;

  @override
  Widget build(BuildContext context) {
    var id = context.watch<FollowProvider>().followerList;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {Navigator.pop(context);}),
        title: context.watch<FollowProvider>().tab == "follower" ? Text("Follower Page") : Text("Following Page")
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            TextButton(onPressed: () {context.read<FollowProvider>().changeTab("follower");}, child: Text("Follwer")),
            TextButton(onPressed: () {context.read<FollowProvider>().changeTab("following");}, child: Text("Following"))
          ]),
          Expanded(
            child: (context.watch<FollowProvider>().tab == "follower" && context.watch<FollowProvider>().followerList.isEmpty == true)
            || (context.watch<FollowProvider>().tab == "following" && context.watch<FollowProvider>().followingList.isEmpty == true)
            ? NoticeNoFollow()
            : ListView.separated(
              itemCount: context.watch<FollowProvider>().tab == "follower" ? context.watch<FollowProvider>().followerList.length : context.watch<FollowProvider>().followingList.length,
              itemBuilder: (c,i) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/profile/${id[i]["id"].toString()}');
                },
                child: SizedBox(
                  height: 40,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    Icon(Icons.account_circle),
                    context.watch<FollowProvider>().tab == "follower"
                    ? Text("${context.watch<FollowProvider>().followerList[i]["id"]}")
                    : Text("${context.watch<FollowProvider>().followingList[i]["id"]}")
                  ]),
                )
              ),
              separatorBuilder: (context, index) => Divider(thickness: 1),
            )
          )
        ]
      ),
    );
  }
}

class NoticeNoFollow extends StatelessWidget {
  const NoticeNoFollow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
      Icon(Icons.error),
      context.watch<FollowProvider>().tab == "follower" ? Text("No Follower") : Text("No Following")
    ]);
  }
}
