import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:medic_book/model/patients.dart';
import 'package:medic_book/model/user.dart';

import 'clinics.dart';

PatientsVisits patientsVisitsFromJson(String str) =>
    PatientsVisits.fromJson(json.decode(str));

String patientsVisitsToJson(PatientsVisits data) => json.encode(data.toJson());

@Entity(
  tableName: 'PatientsVisits',
  foreignKeys: [
    ForeignKey(
      childColumns: ['patientId'],
      parentColumns: ['id'],
      entity: Patients,
    ),
    ForeignKey(
      childColumns: ['doctorId'],
      parentColumns: ['id'],
      entity: User,
    ),
    ForeignKey(
      childColumns: ['clinicId'],
      parentColumns: ['id'],
      entity: Clinic,
    ),
  ],
)
class PatientsVisits {
  @PrimaryKey(autoGenerate: true)
  int id;
  @ColumnInfo(name: 'clinicId')
  int clinicId;
  @ColumnInfo(name: 'doctorId')
  int doctorId;
  @ColumnInfo(name: 'patientId')
  int patientId;
  String diagnosis;
  String prescription;
  String recommendations;
  int status;
  String symptoms;
  String updatedBy;
  String visitDate;
  String visitStatus;
  String visitTime;

  PatientsVisits({
    this.clinicId,
    this.diagnosis,
    this.doctorId,
    this.id,
    this.patientId,
    this.prescription,
    this.recommendations,
    this.status,
    this.symptoms,
    this.updatedBy,
    this.visitDate,
    this.visitStatus,
    this.visitTime,
  });

  factory PatientsVisits.fromJson(Map<String, dynamic> json) => PatientsVisits(
        clinicId: json["clinic_id"],
        diagnosis: json["diagnosis"],
        doctorId: json["doctor_id"],
        id: json["id"],
        patientId: json["patient_id"],
        prescription: json["prescription"],
        recommendations: json["recommendations"],
        status: json["status"],
        symptoms: json["symptoms"],
        updatedBy: json["updated_by"],
        visitDate: json["visit_date"],
        visitStatus: json["visit_status"],
        visitTime: json["visit_time"],
      );

  Map<String, dynamic> toJson() => {
        "clinic_id": clinicId,
        "diagnosis": diagnosis,
        "doctor_id": doctorId,
        "id": id,
        "patient_id": patientId,
        "prescription": prescription,
        "recommendations": recommendations,
        "status": status,
        "symptoms": symptoms,
        "updated_by": updatedBy,
        "visit_date": visitDate,
        "visit_status": visitStatus,
        "visit_time": visitTime,
      };
}

@dao
abstract class PatientsVisitsDao {
  @Query('SELECT * FROM PatientsVisits')
  Future<List<PatientsVisits>> findAllPatientsVisits();

  @Query('SELECT * FROM PatientsVisits WHERE id = :id')
  Future<List<PatientsVisits>> findDataByValue(int value);
  @insert
  Future<List<int>> insertAllPatientsVisits(List<PatientsVisits> list);
  @insert
  Future<void> insertPatientsVisits(PatientsVisits patientsVisits);

  @update
  Future<int> updateAllPatientsVisits(List<PatientsVisits> list);
  @update
  Future<void> updatePatientsVisits(PatientsVisits patientsVisits);
}
