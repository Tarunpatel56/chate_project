class MsgModel {
  String? name;
  String? image;
  String? message;
  String? time;
  bool? isMe;

  MsgModel({this.name, this.image, this.message, this.time, this.isMe});

  MsgModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    message = json['message'];
    time = json['time'];
    isMe = json['isMe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['message'] = message;
    data['time'] = time;
    data['isMe'] = isMe;
    return data;
  }
}






List DummyMsg = [
  {
    "name": "Raj",
    "image": "https://randomuser.me/api/portraits/men/1.jpg",
    "message": "Hey Tony, how are you?",
    "time": "10:00 AM",
    "isMe": true
  },
  {
    "name": "Tony",
    "image": "https://randomuser.me/api/portraits/men/2.jpg",
    "message": "Hi Raj! I'm good, just working on a project. What about you?",
    "time": "10:02 AM",
    "isMe": false
  },
  {
    "name": "Raj",
    "image": "https://randomuser.me/api/portraits/men/1.jpg",
    "message": "Nice! I’m also working on Flutter, trying to build a chat UI.",
    "time": "10:05 AM",
    "isMe": true
  },
  {
    "name": "Tony",
    "image": "https://randomuser.me/api/portraits/men/2.jpg",
    "message": "Oh great! Flutter is powerful for UI. Do you need any help?",
    "time": "10:07 AM",
    "isMe": false
  },
  {
    "name": "Raj",
    "image": "https://randomuser.me/api/portraits/men/1.jpg",
    "message": "Yes bro, I’m stuck with ListView. Messages are not scrolling properly.",
    "time": "10:10 AM",
    "isMe": true
  },
  {
    "name": "Tony",
    "image": "https://randomuser.me/api/portraits/men/2.jpg",
    "message": "Don’t worry. Wrap ListView with `Expanded` or use `Flexible`. That will fix it.",
    "time": "10:12 AM",
    "isMe": false
  },
  {
    "name": "Raj",
    "image": "https://randomuser.me/api/portraits/men/1.jpg",
    "message": "Thanks Tony! You saved me again 😂",
    "time": "10:15 AM",
    "isMe": true
  },
  {
    "name": "Tony",
    "image": "https://randomuser.me/api/portraits/men/2.jpg",
    "message": "Haha anytime bro! Let’s catch up later in evening.",
    "time": "10:17 AM",
    "isMe": false
  },
  {
    "name": "Raj",
    "image": "https://randomuser.me/api/portraits/men/1.jpg",
    "message": "Sure 👍 See you!",
    "time": "10:18 AM",
    "isMe": true
  }
];
