class UserModel {
  final String email;
  final String image;
  final String name;
  final String socialId;

  UserModel({
    required this.email,
    required this.image,
    required this.name,
    required this.socialId,
  });


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      socialId: json['socialId'] ?? '',
    );
  }

  // Convert Dart object → JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'image': image,
      'name': name,
      'socialId': socialId,
    };
  }
}
