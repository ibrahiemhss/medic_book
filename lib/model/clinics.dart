import 'dart:convert';

import 'package:floor/floor.dart';

Clinic clinicFromJson(String str) => Clinic.fromJson(json.decode(str));

String clinicToJson(Clinic data) => json.encode(data.toJson());

@Entity(
  tableName: 'Clinic',
)
class Clinic {
  @PrimaryKey(autoGenerate: true)
  int id;
  String address;
  String clinicName;
  String logo;
  String phone;
  String since;
  String specialization;
  String updatedBy;

  Clinic({
    this.address,
    this.clinicName,
    this.id,
    this.logo,
    this.phone,
    this.since,
    this.specialization,
    this.updatedBy,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
        address: json["address"],
        clinicName: json["clinic_name"],
        id: json["id"],
        logo: json["logo"],
        phone: json["phone"],
        since: json["since"],
        specialization: json["specialization"],
        updatedBy: json["updated_by"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "clinic_name": clinicName,
        "id": id,
        "logo": logo,
        "phone": phone,
        "since": since,
        "specialization": specialization,
        "updated_by": updatedBy,
      };
}

@dao
abstract class ClinicDao {
  @Query('SELECT * FROM Clinic')
  Future<List<Clinic>> findAllClinic();

  @Query('SELECT * FROM Clinic WHERE id = :id')
  Future<List<Clinic>> findDataByValue(int value);
  @insert
  Future<List<int>> insertAllClinic(List<Clinic> list);
  @insert
  Future<void> insertClinic(Clinic clinic);

  @update
  Future<int> updateAllClinic(List<Clinic> list);
  @update
  Future<void> updateClinic(Clinic clinic);
}
