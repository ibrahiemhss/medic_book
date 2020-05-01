
import 'dart:convert';

import 'package:floor/floor.dart';

import 'clinics.dart';

User UserFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

@Entity(
  tableName: 'User',
  foreignKeys: [
    ForeignKey(
      childColumns: ['clinicId'],
      parentColumns: ['id'],
      entity: Clinic,
    ),

  ],
)
class User {
  @PrimaryKey(autoGenerate: true)
  int id;
  @ColumnInfo(name: 'clinicId')
  int clinicId;
  String createdAt;
  String email;
  int job;
  String password;
  String phone;
  String photo;
  int role;
  String specialization;
  int status;
  String theName;
  String updatedBy;

  User({
    this.clinicId,
    this.createdAt,
    this.email,
    this.id,
    this.job,
    this.password,
    this.phone,
    this.photo,
    this.role,
    this.specialization,
    this.status,
    this.theName,
    this.updatedBy,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    clinicId: json["clinic_id"],
    createdAt:json["created_at"],
    email: json["email"],
    id: json["id"],
    job: json["job"],
    password: json["password"],
    phone: json["phone"],
    photo: json["photo"],
    role: json["role"],
    specialization: json["specialization"],
    status: json["status"],
    theName: json["the_name"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "clinic_id": clinicId,
    "created_at": createdAt,
    "email": email,
    "id": id,
    "job": job,
    "password": password,
    "phone": phone,
    "photo": photo,
    "role": role,
    "specialization": specialization,
    "status": status,
    "the_name": theName,
    "updated_by": updatedBy,
  };
}
@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Future<List<User>> findAllUser();

  @Query('SELECT * FROM User WHERE id = :id')
  Future<User>  findDataByValue(int value);
  @insert
  Future<List<int>> insertAllUser(List<User> list);
  @insert
  Future<void> insertUser(User user);

  @update
  Future<int> updateAllUser(List<User> list);
  @update
  Future<void> updateUser(User user);
}