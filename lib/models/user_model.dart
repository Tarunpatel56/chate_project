class UserModel {
  final String socialId;
  final String name;
  final String email;
  final String image;

  UserModel({
    required this.socialId,
    required this.name,
    required this.email,
    required this.image,
  });

  // Convert JSON to Dart object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      socialId: json['socialId'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
    );
  }

  // Convert Dart object to JSON
  Map<String, dynamic> toJson() {
    return {
      'socialId': socialId,
      'name': name,
      'email': email,
      'image': image,
    };
  }
}
