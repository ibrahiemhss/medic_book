
import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:medic_book/model/user.dart';

AppPref appPrefFromJson(String str) => AppPref.fromJson(json.decode(str));

String appPrefToJson(AppPref data) => json.encode(data.toJson());
@Entity(
  tableName: 'AppPref',
  foreignKeys: [
    ForeignKey(
      childColumns: ['userId'],
      parentColumns: ['id'],
      entity: User,
    ),

  ],
)
class AppPref {
  @PrimaryKey(autoGenerate: true)
  int id;
  @ColumnInfo(name: 'userId')
  int userId;
  int appMode;
  int bigSize;
  String fontColor;
  int mainDoctorId;
  int regularSize;
  String reportsPath;


  AppPref({
    this.appMode,
    this.bigSize,
    this.fontColor,
    this.id,
    this.mainDoctorId,
    this.regularSize,
    this.reportsPath,
    this.userId,
  });

  factory AppPref.fromJson(Map<String, dynamic> json) => AppPref(
    appMode: json["app_mode"],
    bigSize: json["big_size"],
    fontColor: json["font_color"],
    id: json["id"],
    mainDoctorId: json["main_doctor_id"],
    regularSize: json["regular_size"],
    reportsPath: json["reports_path"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "app_mode": appMode,
    "big_size": bigSize,
    "font_color": fontColor,
    "id": id,
    "main_doctor_id": mainDoctorId,
    "regular_size": regularSize,
    "reports_path": reportsPath,
    "user_id": userId,
  };
}
@dao
abstract class AppPrefDao {
  @Query('SELECT * FROM AppPref')
  Future<List<AppPref>> findAllAppPref();

  @Query('SELECT * FROM AppPref WHERE id = :id')
  Future<List<AppPref>>  findDataByValue(int value);
  @insert
  Future<List<int>> insertAllAppPref(List<AppPref> listAppPref);
  @insert
  Future<void> insertAppPref(AppPref pref);

  @update
  Future<int> updateAllAppPrefs(List<AppPref> listAppPref);
  @update
  Future<void> updateAppPref(AppPref pref);
}
