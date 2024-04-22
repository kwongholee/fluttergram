import 'package:client/stores/directMessage.dart';
import 'package:client/stores/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chatbox/chatbox.dart';

class DirectMessageRoom extends StatefulWidget {
  const DirectMessageRoom({Key? key, this.id}) : super(key: key);
  final id;

  @override
  State<DirectMessageRoom> createState() => _DirectMessageRoomState();
}

class _DirectMessageRoomState extends State<DirectMessageRoom> {
  String sendMessage = "";
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {Navigator.pop(context);}),
        title: Text(widget.id),
      ),
      body: SizedBox(
        child: Column(children: [
          Expanded(
            child: GestureDetector(
              onTap: () {FocusScope.of(context).unfocus();},
              child: Align(
                alignment: Alignment.topCenter,
                child:  ListView.separated(
                  reverse: true,
                  itemCount: context.watch<DirectMessage>().chat.length,
                  separatorBuilder: (context, index) => SizedBox(height: 5),
                  itemBuilder: (c, i) =>
                  context.watch<DirectMessage>().chat[i]["writer"] == context.watch<UserProvider>().userInfo["id"]
                  ? ChatBox(
                    message: context.watch<DirectMessage>().chat[i]["message"]!,
                    recieved: false,
                    chatBoxColor: Colors.lightGreen
                  )
                  : ChatBox(
                    message: context.watch<DirectMessage>().chat[i]["message"]!,
                    recieved: true,
                    chatBoxColor: Colors.greenAccent,
                  )
                )
              )
            )
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.end, children: [
            SizedBox(
              width: 200,
              child: TextField(
                controller: _controller,
                onChanged: (e) {setState(() {
                  sendMessage = e;
                });},
                decoration: InputDecoration(
                  hintText: "메세지를 입력해주세요",
                ),
              )
            ),
            TextButton(
              onPressed: () {
                context.read<DirectMessage>().addChat({
                  "chatroom": widget.id.toString(),
                  "writer": context.read<UserProvider>().userInfo["id"]!,
                  "message": sendMessage
                });
                setState(() {
                  sendMessage = "";
                });
                FocusScope.of(context).unfocus();
                _controller.clear();
              },
              child: Text("send"),
            )
          ])
        ]),
      ),
    );
  }
}
