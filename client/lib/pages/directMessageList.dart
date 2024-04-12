import 'package:client/stores/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class DirectMessageList extends StatefulWidget {
  const DirectMessageList({Key? key}) : super(key: key);

  @override
  State<DirectMessageList> createState() => _DirectMessageListState();
}

class _DirectMessageListState extends State<DirectMessageList> {
  var contactList = ["이광호", "김민아", "이서진", "황혁수", "장영주"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          contactList.add("호두");
        });
      }, child: Icon(Icons.add),),
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          context.read<userProvider>().changeTab(0);
        }, icon: Icon(Icons.arrow_back)),
        title: Text("Fluttergram Direct Message"),
      ),
      body: ListView.builder(itemCount: contactList.length, itemBuilder: (c,i) {
        return Contact(contactList: contactList, num: i);
      }),
    );
  }
}

class Contact extends StatefulWidget {
  const Contact({Key? key, this.contactList, this.num}) : super(key: key);
  final contactList;
  final num;

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.account_circle),
          Text(widget.contactList[widget.num])
        ],
      ),
    );
  }
}
