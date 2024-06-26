import 'package:client/stores/userProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class DirectMessageList extends StatefulWidget {
  const DirectMessageList({Key? key}) : super(key: key);

  @override
  State<DirectMessageList> createState() => _DirectMessageListState();
}

class _DirectMessageListState extends State<DirectMessageList> {
  var contactList = [];
  void addContactList(v) {
    setState(() {
      contactList.add(v);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(context: context, builder: (context) {
          return addChatDialog(addContactList: addContactList);
        });
      }, child: Icon(Icons.add),),
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        title: Text("Fluttergram Direct Message"),
      ),
      body: contactList.isEmpty ? NoticeNoRoom() : ListView.separated(itemCount: contactList.length, itemBuilder: (c,i) {
        return Contact(contactList: contactList, num: i);
      }, separatorBuilder: (context, index) => Divider(),),
    );
  }
}

class NoticeNoRoom extends StatelessWidget {
  const NoticeNoRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
        Icon(Icons.error),
        Text("No Chatroom")
      ])
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
    return SizedBox(
      height: 50,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/directmessage/room/${widget.contactList[widget.num]["chatroom"]}");
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.account_circle),
            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(widget.contactList[widget.num]["chatroom"]),
              Text(widget.contactList[widget.num]["account"])
            ],)
          ],
        )
      ),
    );
  }
}

class addChatDialog extends StatefulWidget {
  const addChatDialog({Key? key, this.addContactList}) : super(key: key);
  final addContactList;

  @override
  State<addChatDialog> createState() => _addChatDialogState();
}

class _addChatDialogState extends State<addChatDialog> {
  String chatroomName = "";
  String accountName = "";

  @override
  Widget build(BuildContext context) {
    return Dialog(child: Container(
      padding: EdgeInsets.all(30),
      width: 300,
      height: 300,
      child: Column(children: [
        TextField(onChanged: (e) {chatroomName = e;}, decoration: InputDecoration(labelText: "채팅방명")),
        TextField(onChanged: (e) {accountName = e;}, decoration: InputDecoration(labelText: "계정명")),
        TextButton(onPressed: () {
          widget.addContactList({"chatroom": chatroomName, "account": accountName});
          Navigator.pop(context);
        }, child: Text("add"))
      ],),
    ));
  }
}

