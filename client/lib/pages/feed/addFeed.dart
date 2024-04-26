import 'package:client/stores/feedListProvider.dart';
import 'package:client/stores/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

class AddFeed extends StatefulWidget {
  const AddFeed({Key? key}) : super(key: key);

  @override
  State<AddFeed> createState() => _AddFeedState();
}

class _AddFeedState extends State<AddFeed> {
  final dio = Dio();
  var info = {"writer": "", "introduce": "", "like": 0};

  @override
  Widget build(BuildContext context) {
    var userId = context.watch<UserProvider>().userInfo["id"]!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {Navigator.pop(context);}),
        title: Text("Add Feed"),
      ),
      body: SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Image.asset('assets/jiwoo.jpg'),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text("Introduce your Feed"),
          SizedBox(width: 150, child: TextField(onChanged: (e) {setState(() {
            setState(() {
              info["introduce"] = e;
            });
          });}))
        ]),
        TextButton(onPressed: () async {
          setState(() {
            info["writer"] = userId;
          });
          final response = await dio.post('http://192.168.35.50:8080/feed/new', data: info, options: Options(contentType: Headers.jsonContentType));
          context.read<UserFeedListProvider>().addFeed(info);
          Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
        }, child: Text("add"))
      ]))
    );
  }
}
