import 'package:flutter/material.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  var settingList = [
    {"name": "id 고치기", "route": "/profile/setting/modification/id"},
    {"name": "이름 고치기", "route": "/profile/setting/modification/name"},
    {"name": "상태메세지 고치기", "route": "/profile/setting/modification/introduce"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {Navigator.pop(context);}), title: Text("Profile Edit Page")),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (c, i) => InkWell(
            onTap: () {Navigator.pushNamed(context, settingList[i]["route"]!);},
            child: Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
              padding: EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Icon(Icons.badge),
                Text(settingList[i]["name"]!)
              ]),
            )
          )
      )
    );
  }
}
