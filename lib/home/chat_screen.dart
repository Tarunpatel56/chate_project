import 'package:facebook/models/messages_model.dart';
import 'package:flutter/material.dart';

import '../models/chat_user_model.dart';

class ChatScreen extends StatefulWidget {
  final ChatUserModel user;
  final ChatUserModel user2;
  final String? from;

  const ChatScreen({super.key, required this.user, this.from, required this.user2});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isLoading = true;
  final List<MsgModel> chatMessageList = [];
  final TextEditingController msgController = TextEditingController();
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() {
    isLoading = true;
    for (var msg in DummyMsg) {
      chatMessageList.add(MsgModel.fromJson(msg));
    }
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          dense: true,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.user.image ?? "",),
          ),
          title: Text(widget.user.name ?? "", style: TextStyle(fontSize: 20)),
          subtitle: Text("NA", style: TextStyle(fontSize: 15)),
        ),

        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: Icon(Icons.video_camera_back)),
        ],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
   
          SizedBox(height: 60),
          Center(
            child: SizedBox(
              width: 100,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/men/2.jpg",
                    ),
                  ),

                  Positioned(
                    right: 10,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: NetworkImage(widget.user.image ?? ""),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Text(
              "Say hi to your new Facebook friend, ${widget.user.name ?? ""}.",
            ),
          ),
          SizedBox(height: 40,),

          Expanded(
            child: ListView.separated(
              reverse: true,
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _messageCard(chatMessageList[index]);
              },
              separatorBuilder: (context, index) => SizedBox(height: 8),
              itemCount: chatMessageList.length,
            ),
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // IconButton(onPressed: () {}, icon: Icon(Icons.circle)),
            // IconButton(onPressed: () {}, icon: Icon(Icons.video_camera_back)),
            // IconButton(onPressed: () {}, icon: Icon(Icons.photo)),
            // IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
            Expanded(
              child: TextFormField(
                controller: msgController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hint: Text("Aa", style: TextStyle(fontSize: 18)),
                  suffixIcon: Icon(Icons.emoji_emotions_rounded),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                _sendMessage();
              },
              icon: Icon(Icons.done),
            ),
          ],
        ),
      ),
    );
  }

  Widget _messageCard(MsgModel data) {
    return Row(
      mainAxisAlignment: data.isMe!
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Visibility(
          visible: data.isMe! == false,
          child: CircleAvatar(
            backgroundImage: NetworkImage(widget.user.image ?? ""),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Chip(
            label: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  child: Text(data.message ?? 'NA', maxLines: 10),
                ),
                Text(DateTime.now().toIso8601String().split("T").first),
              ],
            ),
          ),
        ),

        Visibility(
          visible: data.isMe!,
          child: CircleAvatar(backgroundImage: NetworkImage(data.image ?? '')),
        ),
      ],
    );
  }

  _sendMessage() {
    if (msgController.text.trim().isNotEmpty) {
      chatMessageList.insert(
        0,
        MsgModel.fromJson({
          "name": "Raj",
          "image": "https://randomuser.me/api/portraits/men/1.jpg",
          "message": msgController.text,
          "time": "10:18 AM",
          "isMe": true,
        }),
      );
      msgController.clear();
      setState(() {});
    }
    else{

    }
  }
}
