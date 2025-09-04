class UserModel {
  late String email;
  late String? displayName;
  late String uid;
  late String? photoUrl;

  UserModel({
    required this.email,
    this.displayName,
    required this.uid,
    this.photoUrl
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    displayName = json['displayName'];
    uid = json['uid'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'displayName': displayName,
      'uid': uid,
      'photoUrl': photoUrl
    };
  }
}
