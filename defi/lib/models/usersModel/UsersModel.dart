class UsersModel {
  String? name;
  String? email;
  String? uId;
  String? cover;
  String? bio;
  String? profileImage;
  bool? isEmailVerified;

  UsersModel({
    this.name,
    this.email,
    this.uId,
    this.cover,
    this.bio,
    this.profileImage,
    this.isEmailVerified,
  });

  UsersModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    uId = json['uid'];
    cover = json['cover'];
    bio = json['bio'];
    profileImage = json['profileImage'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'uid': uId,
      'profileImage': profileImage,
      'bio': bio,
      'cover': cover,
      'isEmailVerified': isEmailVerified,
    };
  }
}
