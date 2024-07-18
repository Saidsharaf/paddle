class UsersModel {
  String? name;
  String? email;
  String? uId;

  UsersModel({
    this.name,
    this.email,
    this.uId,
  });

  UsersModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    uId = json['uid'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'uid': uId,
    };
  }
}
