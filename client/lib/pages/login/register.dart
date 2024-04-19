import 'package:client/stores/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var id = "";
  var pw = "";
  var name = "";
  var introduce = "";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (c) => userProvider(), child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text("Fluttergram Login", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text("ID"),
            SizedBox(
              width: 200,
              height: 40,
              child: TextField(onChanged: (e){setState(() {
                id = e;
              });}, decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ID'
              )),
            )
          ]),
          Container(padding: EdgeInsets.fromLTRB(0, 20, 0, 15), child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text("Password"),
            SizedBox(
              width: 200,
              height: 40,
              child: TextField(onChanged: (e){setState(() {
                pw = e;
              });}, decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password'
              ), obscureText: true,),
            )
          ]),),
          Container(padding: EdgeInsets.fromLTRB(0, 5, 0, 15), child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text("Name"),
            SizedBox(
              width: 200,
              height: 40,
              child: TextField(onChanged: (e){setState(() {
                name = e;
              });}, decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name'
              ), obscureText: true,),
            )
          ]),),
          Container(padding: EdgeInsets.fromLTRB(0, 5, 0, 15), child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text("Introduce youself"),
            SizedBox(
              width: 200,
              height: 40,
              child: TextField(onChanged: (e){setState(() {
                introduce = e;
              });}, decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Introduce yourself'
              ), obscureText: true,),
            )
          ]),),
          TextButton(onPressed: () {
            if(id == "" || pw == "" || name == "" || introduce == "") {
              showDialog(context: context, builder: (context) => NoticeDialog());
            }
            else {
              context.read<userProvider>().setProfile(id, pw, name, introduce);
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            }
          }, child: Text("Register")),
        ],
      ),
    ));
  }
}

class NoticeDialog extends StatelessWidget {
  const NoticeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(child: SizedBox(
      width: 300,
      height: 300,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text("모든 필드를 다 입력해주세요!"),
        TextButton(onPressed: () {Navigator.pop(context);}, child: Text("닫기"))
      ],),
    ));
  }
}
