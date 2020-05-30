import 'dart:convert';
import 'dart:ui';

import 'package:medic_book/data/database/database.dart';
import 'package:medic_book/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medic_book/helpers/constants.dart';

abstract class LocalDataSource {
  bool checkLogedIn();
  bool secondEnter();
  void setSecondEnter(bool enter);
  Future<User> getUsetInfo(int id);
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;
  final AppDatabase appDatabase;
  LocalDataSourceImpl({this.sharedPreferences, this.appDatabase});

  @override
   checkLogedIn() async {
   // sharedPreferences.getBool(SharedPreferenceKeys.SIGNED_IN);
    try {
      return false;
     // return sharedPreferences.getBool(SharedPreferenceKeys.SIGNED_IN)??false;

    } catch (e) {
      print("checkLogedIn exception =${e.toString()}");
    }
  }

  @override
  Future<User> getUsetInfo(int id) async {
    try {
      return await null;

   //   return await appDatabase.userDao.findDataByValue(id);
    } catch (e) {
      print("getUsetInfo exception =${e.toString()}");
    }
  }

  @override
  bool secondEnter() {
    try {
    //  print("LocalDataSource secondEnter value =${sharedPreferences.getBool(SharedPreferenceKeys.SECOND_ENTER).toString()}");
      return true;

     // return sharedPreferences.getBool(SharedPreferenceKeys.SECOND_ENTER)??false;

    } catch (e) {
      print("checkLogedIn exception =${e.toString()}");
    }
  }

  @override
   setSecondEnter(bool enter) {
    print("LocalDataSource SecondEnter prepared =${enter.toString()}");
    //sharedPreferences.setBool(SharedPreferenceKeys.SECOND_ENTER,enter);
  }
}
