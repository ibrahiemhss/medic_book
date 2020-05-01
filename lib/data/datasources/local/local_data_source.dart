import 'dart:convert';
import 'dart:ui';

import 'package:medic_book/data/database/database.dart';
import 'package:medic_book/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<bool> checkLogedIn();
  Future<User> getUsetInfo(int id);
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;
  final AppDatabase appDatabase;
  LocalDataSourceImpl({this.sharedPreferences, this.appDatabase});

  @override
  Future<bool> checkLogedIn() async {
    try {
      return await appDatabase.rememberMeDao.findAllRememberMe() == null
          ? false
          : true;
    } catch (e) {
      print("checkLogedIn exception =${e.toString()}");
    }
  }

  @override
  Future<User> getUsetInfo(int id) async {
    try {
      return await appDatabase.userDao.findDataByValue(id);
    } catch (e) {
      print("getUsetInfo exception =${e.toString()}");
    }
  }
}
