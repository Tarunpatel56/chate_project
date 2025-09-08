class UserStatusModel {
  String? image;
  String? name;

  UserStatusModel({this.image, this.name});

  UserStatusModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}
List userData = [
  {
    "image": "https://randomuser.me/api/portraits/men/11.jpg",
    "name": "Rahul Verma"
  },
  {
    "image": "https://randomuser.me/api/portraits/women/21.jpg",
    "name": "Priya Sharma"
  },
  {
    "image": "https://randomuser.me/api/portraits/men/31.jpg",
    "name": "Amit Singh"
  },
  {
    "image": "https://randomuser.me/api/portraits/women/41.jpg",
    "name": "Neha Gupta"
  },
  {
    "image": "https://randomuser.me/api/portraits/men/51.jpg",
    "name": "Rohan Patel"
  },
  {
    "image": "https://randomuser.me/api/portraits/women/61.jpg",
    "name": "Sneha Desai"
  },
];
