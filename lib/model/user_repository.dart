import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sl_ui_kit/data/state_entity.dart';

import '../data/user_entity.dart';

class UserRepository {
  static Future<StateEntity> login(String phone, String pwd,
      {String? jsonString}) async {
    StateEntity entity = StateEntity();
    Future<StateEntity> data = Future.delayed(Duration(seconds: 2), () {
      if (jsonString != null) {
        entity = StateEntity.fromJson(json.decode(jsonString));
      }
      return entity;
    });
    return data;
  }
  static Future<UserEntity> getUserData(
      {String? jsonString}) async {
    UserEntity entity = UserEntity();
    Future<UserEntity> data = Future.delayed(Duration(seconds: 2), () {
      if (jsonString != null) {
        entity = UserEntity.fromJson(json.decode(jsonString));
      }
      return entity;
    });
    return data;
  }
}
