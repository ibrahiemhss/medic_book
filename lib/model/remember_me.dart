import 'dart:convert';

import 'package:floor/floor.dart';

RememberMe rememberMeFromJson(String str) => RememberMe.fromJson(json.decode(str));

String rememberToJson(RememberMe data) => json.encode(data.toJson());
@Entity(
  tableName: 'RememberMe',
)
class RememberMe {
  @PrimaryKey(autoGenerate: true)
  int id;
  String passWord;
  String userName;

  RememberMe({
    this.id,
    this.passWord,
    this.userName,
  });

  factory RememberMe.fromJson(Map<String, dynamic> json) => RememberMe(
    id: json["id"],
    passWord: json["pass_word"],
    userName: json["user_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pass_word": passWord,
    "user_name": userName,
  };
}
@dao
abstract class RememberMeDao {
  @Query('SELECT * FROM RememberMe')
  Future<List<RememberMe>> findAllRememberMe();

  @Query('SELECT * FROM RememberMe WHERE id = :id')
  Future<List<RememberMe>>  findDataByValue(int value);
  @insert
  Future<List<int>> insertAllRememberMe(List<RememberMe> list);
  @insert
  Future<void> insertRememberMe(RememberMe rememberMe);

  @update
  Future<int> updateAllRememberMe(List<RememberMe> list);
  @update
  Future<void> updateRememberMe(RememberMe rememberMe);
}