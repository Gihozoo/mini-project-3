// ignore_for_file: empty_constructor_bodies

class UserModel {
  String? uid;
  String? username;
  String? email;

  UserModel({this.uid, this.username, this.email});

  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map["uid"], username: map["username"], email: map["email"]);
  }

  Map<String, dynamic> toMap() {
    return {"uid": uid, "username": username, "email": email};
  }
}
