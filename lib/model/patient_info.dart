
import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:medic_book/model/patients.dart';

PatientInfo patientInfoFromJson(String str) => PatientInfo.fromJson(json.decode(str));

String patientInfoToJson(PatientInfo data) => json.encode(data.toJson());
@Entity(
  tableName: 'PatientInfo',
  foreignKeys: [
    ForeignKey(
      childColumns: ['patientId'],
      parentColumns: ['id'],
      entity: Patients,
    ),
  ],
)
class PatientInfo {
  @PrimaryKey(autoGenerate: true)
  int id;
  @ColumnInfo(name: 'patientId')
  int patientId;
  String bloodGroup;
  String maritalStatus;
  String address;
  String chronicDisease;
  String surgeryRecord;
  String socialRecord;
  String familyRecord;
  String drugSensitivity;
  String updatedBy;

  PatientInfo({
    this.id,
    this.patientId,
    this.bloodGroup,
    this.maritalStatus,
    this.address,
    this.chronicDisease,
    this.surgeryRecord,
    this.socialRecord,
    this.familyRecord,
    this.drugSensitivity,
    this.updatedBy,
  });

  factory PatientInfo.fromJson(Map<String, dynamic> json) => PatientInfo(
    id: json["id"],
    patientId: json["patient_id"],
    bloodGroup: json["blood_group"],
    maritalStatus: json["marital_status"],
    address: json["address"],
    chronicDisease: json["chronic_disease"],
    surgeryRecord: json["surgery_record"],
    socialRecord: json["social_record"],
    familyRecord: json["family_record"],
    drugSensitivity: json["drug_sensitivity"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "patient_id": patientId,
    "blood_group": bloodGroup,
    "marital_status": maritalStatus,
    "address": address,
    "chronic_disease": chronicDisease,
    "surgery_record": surgeryRecord,
    "social_record": socialRecord,
    "family_record": familyRecord,
    "drug_sensitivity": drugSensitivity,
    "updated_by": updatedBy,
  };
}
@dao
abstract class PatientInfoDao {
  @Query('SELECT * FROM PatientInfo')
  Future<List<PatientInfo>> findAllPatientInfo();

  @Query('SELECT * FROM PatientInfo WHERE id = :id')
  Future<List<PatientInfo>>  findDataByValue(int value);
  @insert
  Future<List<int>> insertAllPatientInfo(List<PatientInfo> list);
  @insert
  Future<void> insertPatientInfo(PatientInfo patientInfo);

  @update
  Future<int> updateAllPatientInfo(List<PatientInfo> list);
  @update
  Future<void> updatePatientInfo(PatientInfo patientInfo);
}