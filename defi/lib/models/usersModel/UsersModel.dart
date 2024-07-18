class UsersModel {
  String? name;
  String? email;
  String? uId;
  bool? isEmailVerified;

  UsersModel({
    this.name,
    this.email,
    this.uId,
    this.isEmailVerified,
  });

  UsersModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    uId = json['uid'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'uid': uId,
      'isEmailVerified': isEmailVerified,
    };
  }
}
