class ChatUserModel {
  String? name;
  String? image;
  String? message;
  String? time;
  bool? isMe;

  ChatUserModel({this.name, this.image, this.message, this.time, this.isMe});

  ChatUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    message = json['message']??"";
    time = json['time']??"";
    isMe = json['isMe']??false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['message'] = this.message;
    data['time'] = this.time;
    data['isMe'] = this.isMe;
    return data;
  }
}
 List Dummychat=[
  {
    "name": "Raj",
    "image": "https://randomuser.me/api/portraits/men/1.jpg",
    "message": "Hey! Are you coming today?",
    "time": "09:45 AM",
    "isMe": false
  },
  {
    "name": "Tony",
    "image": "https://randomuser.me/api/portraits/men/2.jpg",
    "message": "Yes bro, almost reached 🚗",
    "time": "09:40 AM",
    "isMe": true
  },
  {
    "name": "Amit",
    "image": "https://randomuser.me/api/portraits/men/3.jpg",
    "message": "Kal movie plan kare?",
    "time": "09:20 AM",
    "isMe": false
  },
  {
    "name": "Priya",
    "image": "https://randomuser.me/api/portraits/women/1.jpg",
    "message": "Ok, I’ll send you the notes.",
    "time": "09:10 AM",
    "isMe": false
  },
  {
    "name": "Sneha",
    "image": "https://randomuser.me/api/portraits/women/2.jpg",
    "message": "Good morning 🌸",
    "time": "08:50 AM",
    "isMe": false
  },
  {
    "name": "Vikram",
    "image": "https://randomuser.me/api/portraits/men/4.jpg",
    "message": "Let’s play football today?",
    "time": "08:35 AM",
    "isMe": false
  },
  {
    "name": "Rohit",
    "image": "https://randomuser.me/api/portraits/men/5.jpg",
    "message": "Done ✅",
    "time": "08:20 AM",
    "isMe": true
  },
  {
    "name": "Anjali",
    "image": "https://randomuser.me/api/portraits/women/3.jpg",
    "message": "Call me when you’re free 📞",
    "time": "08:00 AM",
    "isMe": false
  },
  {
    "name": "Karan",
    "image": "https://randomuser.me/api/portraits/men/6.jpg",
    "message": "Assignment complete?",
    "time": "07:55 AM",
    "isMe": false
  },
  {
    "name": "Meera",
    "image": "https://randomuser.me/api/portraits/women/4.jpg",
    "message": "Okay, see you at class 👩‍🎓",
    "time": "07:45 AM",
    "isMe": false
  },
  {
    "name": "Deepak",
    "image": "https://randomuser.me/api/portraits/men/7.jpg",
    "message": "Where are you?",
    "time": "07:20 AM",
    "isMe": false
  },
  {
    "name": "Pooja",
    "image": "https://randomuser.me/api/portraits/women/5.jpg",
    "message": "Haha 😂 that was funny!",
    "time": "07:10 AM",
    "isMe": false
  },
  {
    "name": "Sanjay",
    "image": "https://randomuser.me/api/portraits/men/8.jpg",
    "message": "See you soon bro 👍",
    "time": "06:55 AM",
    "isMe": false
  },
  {
    "name": "Neha",
    "image": "https://randomuser.me/api/portraits/women/6.jpg",
    "message": "Don’t forget the meeting!",
    "time": "06:45 AM",
    "isMe": false
  },
  {
    "name": "Arjun",
    "image": "https://randomuser.me/api/portraits/men/9.jpg",
    "message": "Yes, I’ll join the call.",
    "time": "06:30 AM",
    "isMe": false
  }
];
