import 'dart:core';

import 'package:flutter/cupertino.dart';

class UserModel {
  final String name;
  final String emailAdress;
  final String userId;

  UserModel(
      {@required this.name, @required this.emailAdress, @required this.userId});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      emailAdress: map['emailAdress'],
      name: map['name'],
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'emailAdress': emailAdress,
      'name': name,
      'userId': userId,
    };
  }
}
