import 'dart:convert';

import 'package:floor/floor.dart';

import 'clinics.dart';

PrescriptionOptions prescriptionOptionsFromJson(String str) => PrescriptionOptions.fromJson(json.decode(str));

String prescriptionOptionsToJson(PrescriptionOptions data) => json.encode(data.toJson());

@Entity(
  tableName: 'PrescriptionOptions',
  foreignKeys: [
    ForeignKey(
      childColumns: ['clinicId'],
      parentColumns: ['id'],
      entity: Clinic,
    ),

  ],
)
class PrescriptionOptions {
  @PrimaryKey(autoGenerate: true)
  int id;
  @ColumnInfo(name: 'clinicId')
  int clinicId;
  String createdAt;
  int createdBy;
  String medicineName;
  int status;

  PrescriptionOptions({
    this.clinicId,
    this.createdAt,
    this.createdBy,
    this.id,
    this.medicineName,
    this.status,
  });

  factory PrescriptionOptions.fromJson(Map<String, dynamic> json) => PrescriptionOptions(
    clinicId: json["clinic_id"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    id: json["id"],
    medicineName: json["medicine_name"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "clinic_id": clinicId,
    "created_at": createdAt,
    "created_by": createdBy,
    "id": id,
    "medicine_name": medicineName,
    "status": status,
  };
}
@dao
abstract class PrescriptionOptionsDao {
  @Query('SELECT * FROM PrescriptionOptions')
  Future<List<PrescriptionOptions>> findAllPrescriptionOptions();

  @Query('SELECT * FROM PrescriptionOptions WHERE id = :id')
  Future<List<PrescriptionOptions>>  findDataByValue(int value);
  @insert
  Future<List<int>> insertAllPrescriptionOptions(List<PrescriptionOptions> list);
  @insert
  Future<void> insertPrescriptionOptions(PrescriptionOptions prescriptionOptions);

  @update
  Future<int> updateAllPrescriptionOptions(List<PrescriptionOptions> list);
  @update
  Future<void> updatePrescriptionOptions(PrescriptionOptions prescriptionOptions);
}