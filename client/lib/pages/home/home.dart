import 'package:client/pages/directmessage/directMessageList.dart';
import 'package:client/stores/userProvider.dart';
import 'package:client/widgets/footBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/mainPage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: context.watch<UserProvider>().direction == "up" ? FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, "/feed/add");
      }, child: Icon(Icons.add)) : null,
      appBar: AppBar(
        title: Text("Fluttergram"),
        actions: [IconButton(onPressed: () {
          Navigator.pushNamed(context, '/directmessage/list');
        }, icon: Icon(Icons.send))],
      ),
      body: Mainpage(),
      bottomNavigationBar: context.watch<UserProvider>().direction == "up" ? FootBar() : null,
    );
  }
}
