
import '../../../domain/entities/auth/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String uid,
    required String email,
    required String name,
    required int age,
    required String phoneNumber,

  }) : super(uid: uid, email: email, name: name, age: age,phoneNumber: phoneNumber);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
      age: json['age'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'age': age,
      'phoneNumber': phoneNumber,
    };
  }
}
