import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.title,
    required super.firstName,
    required super.lastName,
    required super.gender,
    required super.email,
    required super.dob,
    required super.phone,
    required super.address,
    required super.imageUrl,
  });

  factory UserModel.fromEntity(UserEntity user) => UserModel(
        title: user.title,
        firstName: user.firstName,
        lastName: user.lastName,
        gender: user.gender,
        email: user.email,
        dob: user.dob,
        phone: user.phone,
        address: user.address,
        imageUrl: user.imageUrl,
      );

  factory UserModel.fromApiJson(Map<String, dynamic> json) {
    return UserModel(
      title: json["name"]["title"],
      firstName: json["name"]["first"],
      lastName: json["name"]["last"],
      gender: json["gender"],
      email: json["email"],
      dob: DateTime.parse(json["dob"]["date"]),
      phone: json["phone"],
      address: "${json["location"]["street"]["number"]} ${json["location"]["street"]["name"]}"
          "${json["location"]["city"]} ${json["location"]["state"]} ${json["location"]["country"]} "
          "${json["location"]["postcode"]}",
      imageUrl: json["picture"]["large"],
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      title: json["title"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      gender: json["gender"],
      email: json["email"],
      dob: DateTime.parse(json["dob"]),
      phone: json["phone"],
      address: json["address"],
      imageUrl: json["imageUrl"],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "email": email,
        "dob": dob.toString(),
        "phone": phone,
        "address": address,
        "imageUrl": imageUrl,
      };
}
