import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruity/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uId});

  factory UserModel.fromFirebaseUser(User user) => UserModel(
      name: user.displayName ?? '', email: user.email ?? '', uId: user.uid);

  //from json
  factory UserModel.fromMap(Map<String, dynamic> json) =>
      UserModel(name: json['name'], email: json['email'], uId: json['uId']);
}
