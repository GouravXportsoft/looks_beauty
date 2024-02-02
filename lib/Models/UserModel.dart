// ignore_for_file: file_names

class UserModel {
  int? id;
  String? name;
  String? email;
  int? phone;

  UserModel({this.id, this.name, this.email, this.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'] ?? '',
        name: json['username'] ?? '',
        email: json['email'] ?? '',
        phone: json['phone'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "username": name, "email": email, "phone": phone};
  }
}
