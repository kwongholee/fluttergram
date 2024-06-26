import 'package:client/stores/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var settingOption = [
    {"name": "profile edit", "icon": Icon(Icons.edit), "route": "/profile/settings/modification"},
    {"name": "LogOut", "icon": Icon(Icons.logout), "route": "/"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {Navigator.pop(context);},), title: Text("Profile Settings"),),
      body: SizedBox(child: ListView.separated(itemCount: settingOption.length, itemBuilder: (c,i) {
        return SettingList(settingOption: settingOption, num: i);
      }, separatorBuilder: (context, index) => Divider(thickness: 2),)),
    );
  }
}

class SettingList extends StatelessWidget {
  const SettingList({Key? key, this.settingOption, this.num}) : super(key: key);
  final settingOption;
  final num;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
          if(num == 1) {
            context.read<UserProvider>().logIn("");
            Navigator.pushNamedAndRemoveUntil(context, settingOption[num]["route"], (route) => false);
          }
          else {
            Navigator.pushNamed(context, settingOption[num]["route"]);
          }
        },
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          settingOption[num]["icon"],
          Text(settingOption[num]["name"])
        ]),
      ),
    );
  }
}
