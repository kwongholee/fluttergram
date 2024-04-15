import 'package:client/pages/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../stores/userProvider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var id = "";
  var pw = "";

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
          TextButton(onPressed: () {
            context.read<userProvider>().tryLogin(id, pw);
          }, child: Text("Login")),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text("아직 회원가입하지 않으셨다면?"),
            TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (c) => Register()));}, child: Text("Register"))
          ],)
        ],
      ),
    ));
  }
}