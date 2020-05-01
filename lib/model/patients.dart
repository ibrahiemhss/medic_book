
import 'dart:convert';

import 'package:floor/floor.dart';

import 'clinics.dart';

Patients patientsFromJson(String str) => Patients.fromJson(json.decode(str));

String patientsToJson(Patients data) => json.encode(data.toJson());

@Entity(
  tableName: 'Patients',
  foreignKeys: [
    ForeignKey(
      childColumns: ['clinicId'],
      parentColumns: ['id'],
      entity: Clinic,
    ),

  ],
)
class Patients {
  @PrimaryKey(autoGenerate: true)
  int id;
  @ColumnInfo(name: 'clinicId')
  int clinicId;
  String patientName;
  String phone;
  String photo;
  String birthDate;
  int tall;
  int weight;
  int status;
  String about;
  String updatedBy;
  String gender;
  String occupation;

  Patients({
    this.id,
    this.patientName,
    this.phone,
    this.photo,
    this.birthDate,
    this.tall,
    this.weight,
    this.status,
    this.about,
    this.clinicId,
    this.updatedBy,
    this.gender,
    this.occupation,
  });

  factory Patients.fromJson(Map<String, dynamic> json) => Patients(
    id: json["id"],
    patientName: json["patient_name"],
    phone: json["phone"],
    photo: json["photo"],
    birthDate: json["birth_date"],
    tall: json["tall"],
    weight: json["weight"],
    status: json["status"],
    about: json["about"],
    clinicId: json["clinic_id"],
    updatedBy: json["updated_by"],
    gender: json["gender"],
    occupation: json["occupation"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "patient_name": patientName,
    "phone": phone,
    "photo": photo,
    "birth_date": birthDate,
    "tall": tall,
    "weight": weight,
    "status": status,
    "about": about,
    "clinic_id": clinicId,
    "updated_by": updatedBy,
    "gender": gender,
    "occupation": occupation,
  };
}
@dao
abstract class PatientsDao {
  @Query('SELECT * FROM Patients')
  Future<List<Patients>> findAllPatients();

  @Query('SELECT * FROM Patients WHERE id = :id')
  Future<List<Patients>>  findDataByValue(int value);
  @insert
  Future<List<int>> insertAllPatients(List<Patients> list);
  @insert
  Future<void> insertPatients(Patients patients);

  @update
  Future<int> updateAllPatients(List<Patients> list);
  @update
  Future<void> updatePatients(Patients patients);
}