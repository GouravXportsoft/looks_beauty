class UserModel {
  int? id;
  String? name;
  String? email;
  int? phone;
  String? image;
  String? country;
  int? zipcode;
  bool? type;
  bool? is_active;
}

class userAddress {
  int? id;
  int? user_id;
  int? shipping_id;
  String? State;
  String? postal_code;
  bool? is_active;
  String? type;
}
