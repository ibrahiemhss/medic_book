
import 'dart:convert';

import 'package:floor/floor.dart';

AppSettings appSettingsFromJson(String str) => AppSettings.fromJson(json.decode(str));

String appSettingsToJson(AppSettings data) => json.encode(data.toJson());
@Entity(
  tableName: 'AppSettings',
)
class AppSettings {
  @PrimaryKey(autoGenerate: true)
  int id;
  String field7;
  String field1;
  String field10;
  String field2;
  String field3;
  String field4;
  String field5;
  String field6;
  String field8;
  int field9;


  AppSettings({
    this.field7,
    this.field1,
    this.field10,
    this.field2,
    this.field3,
    this.field4,
    this.field5,
    this.field6,
    this.field8,
    this.field9,
    this.id,
  });

  factory AppSettings.fromJson(Map<String, dynamic> json) => AppSettings(
    field7: json["Field7"],
    field1: json["field1"],
    field10: json["field10"],
    field2: json["field2"],
    field3: json["field3"],
    field4: json["field4"],
    field5: json["field5"],
    field6: json["field6"],
    field8: json["field8"],
    field9: json["field9"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "Field7": field7,
    "field1": field1,
    "field10": field10,
    "field2": field2,
    "field3": field3,
    "field4": field4,
    "field5": field5,
    "field6": field6,
    "field8": field8,
    "field9": field9,
    "id": id,
  };
}
@dao
abstract class AppSettingsDao {

  @insert
  Future<void> insertAppSettings(AppSettings appSettings);

  @update
  Future<void> updateAppSettings(AppSettings appSettings);
}
