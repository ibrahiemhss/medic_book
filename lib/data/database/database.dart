
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:medic_book/model/app_pref.dart';
import 'package:medic_book/model/app_settings.dart';
import 'package:medic_book/model/clinics.dart';
import 'package:medic_book/model/patient_info.dart';
import 'package:medic_book/model/patients.dart';
import 'package:medic_book/model/patients_visits.dart';
import 'package:medic_book/model/prescription_options.dart';
import 'package:medic_book/model/remember_me.dart';
import 'package:medic_book/model/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [
  AppPref,
  AppSettings,
  Clinic,
  PatientInfo,
  Patients,
  PatientsVisits,
  PrescriptionOptions,
  RememberMe,
  User
])
abstract class AppDatabase extends FloorDatabase {
  AppPrefDao get appPref;
  AppSettingsDao get appSettingsDoa;
  ClinicDao get clinicDao;
  PatientInfoDao get patientInfoDao;
  PatientsDao get patientsDao;
  PatientsVisitsDao get patientsVisitsDao;
  PrescriptionOptionsDao get prescriptionOptionsDao;
  RememberMeDao get rememberMeDao;
  UserDao get userDao;
}

