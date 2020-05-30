
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? join(await sqflite.getDatabasesPath(), name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AppPrefDao _appPrefInstance;

  AppSettingsDao _appSettingsDoaInstance;

  ClinicDao _clinicDaoInstance;

  PatientInfoDao _patientInfoDaoInstance;

  PatientsDao _patientsDaoInstance;

  PatientsVisitsDao _patientsVisitsDaoInstance;

  PrescriptionOptionsDao _prescriptionOptionsDaoInstance;

  RememberMeDao _rememberMeDaoInstance;

  UserDao _userDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `AppPref` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `userId` INTEGER, `appMode` INTEGER, `bigSize` INTEGER, `fontColor` TEXT, `mainDoctorId` INTEGER, `regularSize` INTEGER, `reportsPath` TEXT, FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `AppSettings` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `field7` TEXT, `field1` TEXT, `field10` TEXT, `field2` TEXT, `field3` TEXT, `field4` TEXT, `field5` TEXT, `field6` TEXT, `field8` TEXT, `field9` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Clinic` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `address` TEXT, `clinicName` TEXT, `logo` TEXT, `phone` TEXT, `since` TEXT, `specialization` TEXT, `updatedBy` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PatientInfo` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `patientId` INTEGER, `bloodGroup` TEXT, `maritalStatus` TEXT, `address` TEXT, `chronicDisease` TEXT, `surgeryRecord` TEXT, `socialRecord` TEXT, `familyRecord` TEXT, `drugSensitivity` TEXT, `updatedBy` TEXT, FOREIGN KEY (`patientId`) REFERENCES `Patients` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Patients` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `clinicId` INTEGER, `patientName` TEXT, `phone` TEXT, `photo` TEXT, `birthDate` TEXT, `tall` INTEGER, `weight` INTEGER, `status` INTEGER, `about` TEXT, `updatedBy` TEXT, `gender` TEXT, `occupation` TEXT, FOREIGN KEY (`clinicId`) REFERENCES `Clinic` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PatientsVisits` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `clinicId` INTEGER, `doctorId` INTEGER, `patientId` INTEGER, `diagnosis` TEXT, `prescription` TEXT, `recommendations` TEXT, `status` INTEGER, `symptoms` TEXT, `updatedBy` TEXT, `visitDate` TEXT, `visitStatus` TEXT, `visitTime` TEXT, FOREIGN KEY (`patientId`) REFERENCES `Patients` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`doctorId`) REFERENCES `User` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`clinicId`) REFERENCES `Clinic` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PrescriptionOptions` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `clinicId` INTEGER, `createdAt` TEXT, `createdBy` INTEGER, `medicineName` TEXT, `status` INTEGER, FOREIGN KEY (`clinicId`) REFERENCES `Clinic` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RememberMe` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `passWord` TEXT, `userName` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `User` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `clinicId` INTEGER, `createdAt` TEXT, `email` TEXT, `job` INTEGER, `password` TEXT, `phone` TEXT, `photo` TEXT, `role` INTEGER, `specialization` TEXT, `status` INTEGER, `theName` TEXT, `updatedBy` TEXT, FOREIGN KEY (`clinicId`) REFERENCES `Clinic` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  AppPrefDao get appPref {
    return _appPrefInstance ??= _$AppPrefDao(database, changeListener);
  }

  @override
  AppSettingsDao get appSettingsDoa {
    return _appSettingsDoaInstance ??=
        _$AppSettingsDao(database, changeListener);
  }

  @override
  ClinicDao get clinicDao {
    return _clinicDaoInstance ??= _$ClinicDao(database, changeListener);
  }

  @override
  PatientInfoDao get patientInfoDao {
    return _patientInfoDaoInstance ??=
        _$PatientInfoDao(database, changeListener);
  }

  @override
  PatientsDao get patientsDao {
    return _patientsDaoInstance ??= _$PatientsDao(database, changeListener);
  }

  @override
  PatientsVisitsDao get patientsVisitsDao {
    return _patientsVisitsDaoInstance ??=
        _$PatientsVisitsDao(database, changeListener);
  }

  @override
  PrescriptionOptionsDao get prescriptionOptionsDao {
    return _prescriptionOptionsDaoInstance ??=
        _$PrescriptionOptionsDao(database, changeListener);
  }

  @override
  RememberMeDao get rememberMeDao {
    return _rememberMeDaoInstance ??= _$RememberMeDao(database, changeListener);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$AppPrefDao extends AppPrefDao {
  _$AppPrefDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _appPrefInsertionAdapter = InsertionAdapter(
            database,
            'AppPref',
            (AppPref item) => <String, dynamic>{
                  'id': item.id,
                  'userId': item.userId,
                  'appMode': item.appMode,
                  'bigSize': item.bigSize,
                  'fontColor': item.fontColor,
                  'mainDoctorId': item.mainDoctorId,
                  'regularSize': item.regularSize,
                  'reportsPath': item.reportsPath
                }),
        _appPrefUpdateAdapter = UpdateAdapter(
            database,
            'AppPref',
            ['id'],
            (AppPref item) => <String, dynamic>{
                  'id': item.id,
                  'userId': item.userId,
                  'appMode': item.appMode,
                  'bigSize': item.bigSize,
                  'fontColor': item.fontColor,
                  'mainDoctorId': item.mainDoctorId,
                  'regularSize': item.regularSize,
                  'reportsPath': item.reportsPath
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _appPrefMapper = (Map<String, dynamic> row) => AppPref(
      appMode: row['appMode'] as int,
      bigSize: row['bigSize'] as int,
      fontColor: row['fontColor'] as String,
      id: row['id'] as int,
      mainDoctorId: row['mainDoctorId'] as int,
      regularSize: row['regularSize'] as int,
      reportsPath: row['reportsPath'] as String,
      userId: row['userId'] as int);

  final InsertionAdapter<AppPref> _appPrefInsertionAdapter;

  final UpdateAdapter<AppPref> _appPrefUpdateAdapter;

  @override
  Future<List<AppPref>> findAllAppPref() async {
    return _queryAdapter.queryList('SELECT * FROM AppPref',
        mapper: _appPrefMapper);
  }

  @override
  Future<List<AppPref>> findDataByValue(int value) async {
    return _queryAdapter.queryList('SELECT * FROM AppPref WHERE id = ?',
        arguments: <dynamic>[value], mapper: _appPrefMapper);
  }

  @override
  Future<List<int>> insertAllAppPref(List<AppPref> listAppPref) {
    return _appPrefInsertionAdapter.insertListAndReturnIds(
        listAppPref, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> insertAppPref(AppPref pref) async {
    await _appPrefInsertionAdapter.insert(
        pref, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> updateAllAppPrefs(List<AppPref> listAppPref) {
    return _appPrefUpdateAdapter.updateListAndReturnChangedRows(
        listAppPref, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> updateAppPref(AppPref pref) async {
    await _appPrefUpdateAdapter.update(pref, sqflite.ConflictAlgorithm.abort);
  }
}

class _$AppSettingsDao extends AppSettingsDao {
  _$AppSettingsDao(this.database, this.changeListener)
      : _appSettingsInsertionAdapter = InsertionAdapter(
            database,
            'AppSettings',
            (AppSettings item) => <String, dynamic>{
                  'id': item.id,
                  'field7': item.field7,
                  'field1': item.field1,
                  'field10': item.field10,
                  'field2': item.field2,
                  'field3': item.field3,
                  'field4': item.field4,
                  'field5': item.field5,
                  'field6': item.field6,
                  'field8': item.field8,
                  'field9': item.field9
                }),
        _appSettingsUpdateAdapter = UpdateAdapter(
            database,
            'AppSettings',
            ['id'],
            (AppSettings item) => <String, dynamic>{
                  'id': item.id,
                  'field7': item.field7,
                  'field1': item.field1,
                  'field10': item.field10,
                  'field2': item.field2,
                  'field3': item.field3,
                  'field4': item.field4,
                  'field5': item.field5,
                  'field6': item.field6,
                  'field8': item.field8,
                  'field9': item.field9
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<AppSettings> _appSettingsInsertionAdapter;

  final UpdateAdapter<AppSettings> _appSettingsUpdateAdapter;

  @override
  Future<void> insertAppSettings(AppSettings appSettings) async {
    await _appSettingsInsertionAdapter.insert(
        appSettings, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> updateAppSettings(AppSettings appSettings) async {
    await _appSettingsUpdateAdapter.update(
        appSettings, sqflite.ConflictAlgorithm.abort);
  }
}

class _$ClinicDao extends ClinicDao {
  _$ClinicDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _clinicInsertionAdapter = InsertionAdapter(
            database,
            'Clinic',
            (Clinic item) => <String, dynamic>{
                  'id': item.id,
                  'address': item.address,
                  'clinicName': item.clinicName,
                  'logo': item.logo,
                  'phone': item.phone,
                  'since': item.since,
                  'specialization': item.specialization,
                  'updatedBy': item.updatedBy
                }),
        _clinicUpdateAdapter = UpdateAdapter(
            database,
            'Clinic',
            ['id'],
            (Clinic item) => <String, dynamic>{
                  'id': item.id,
                  'address': item.address,
                  'clinicName': item.clinicName,
                  'logo': item.logo,
                  'phone': item.phone,
                  'since': item.since,
                  'specialization': item.specialization,
                  'updatedBy': item.updatedBy
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _clinicMapper = (Map<String, dynamic> row) => Clinic(
      address: row['address'] as String,
      clinicName: row['clinicName'] as String,
      id: row['id'] as int,
      logo: row['logo'] as String,
      phone: row['phone'] as String,
      since: row['since'] as String,
      specialization: row['specialization'] as String,
      updatedBy: row['updatedBy'] as String);

  final InsertionAdapter<Clinic> _clinicInsertionAdapter;

  final UpdateAdapter<Clinic> _clinicUpdateAdapter;

  @override
  Future<List<Clinic>> findAllClinic() async {
    return _queryAdapter.queryList('SELECT * FROM Clinic',
        mapper: _clinicMapper);
  }

  @override
  Future<List<Clinic>> findDataByValue(int value) async {
    return _queryAdapter.queryList('SELECT * FROM Clinic WHERE id = ?',
        arguments: <dynamic>[value], mapper: _clinicMapper);
  }

  @override
  Future<List<int>> insertAllClinic(List<Clinic> list) {
    return _clinicInsertionAdapter.insertListAndReturnIds(
        list, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> insertClinic(Clinic clinic) async {
    await _clinicInsertionAdapter.insert(
        clinic, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> updateAllClinic(List<Clinic> list) {
    return _clinicUpdateAdapter.updateListAndReturnChangedRows(
        list, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> updateClinic(Clinic clinic) async {
    await _clinicUpdateAdapter.update(clinic, sqflite.ConflictAlgorithm.abort);
  }
}

class _$PatientInfoDao extends PatientInfoDao {
  _$PatientInfoDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _patientInfoInsertionAdapter = InsertionAdapter(
            database,
            'PatientInfo',
            (PatientInfo item) => <String, dynamic>{
                  'id': item.id,
                  'patientId': item.patientId,
                  'bloodGroup': item.bloodGroup,
                  'maritalStatus': item.maritalStatus,
                  'address': item.address,
                  'chronicDisease': item.chronicDisease,
                  'surgeryRecord': item.surgeryRecord,
                  'socialRecord': item.socialRecord,
                  'familyRecord': item.familyRecord,
                  'drugSensitivity': item.drugSensitivity,
                  'updatedBy': item.updatedBy
                }),
        _patientInfoUpdateAdapter = UpdateAdapter(
            database,
            'PatientInfo',
            ['id'],
            (PatientInfo item) => <String, dynamic>{
                  'id': item.id,
                  'patientId': item.patientId,
                  'bloodGroup': item.bloodGroup,
                  'maritalStatus': item.maritalStatus,
                  'address': item.address,
                  'chronicDisease': item.chronicDisease,
                  'surgeryRecord': item.surgeryRecord,
                  'socialRecord': item.socialRecord,
                  'familyRecord': item.familyRecord,
                  'drugSensitivity': item.drugSensitivity,
                  'updatedBy': item.updatedBy
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _patientInfoMapper = (Map<String, dynamic> row) => PatientInfo(
      id: row['id'] as int,
      patientId: row['patientId'] as int,
      bloodGroup: row['bloodGroup'] as String,
      maritalStatus: row['maritalStatus'] as String,
      address: row['address'] as String,
      chronicDisease: row['chronicDisease'] as String,
      surgeryRecord: row['surgeryRecord'] as String,
      socialRecord: row['socialRecord'] as String,
      familyRecord: row['familyRecord'] as String,
      drugSensitivity: row['drugSensitivity'] as String,
      updatedBy: row['updatedBy'] as String);

  final InsertionAdapter<PatientInfo> _patientInfoInsertionAdapter;

  final UpdateAdapter<PatientInfo> _patientInfoUpdateAdapter;

  @override
  Future<List<PatientInfo>> findAllPatientInfo() async {
    return _queryAdapter.queryList('SELECT * FROM PatientInfo',
        mapper: _patientInfoMapper);
  }

  @override
  Future<List<PatientInfo>> findDataByValue(int value) async {
    return _queryAdapter.queryList('SELECT * FROM PatientInfo WHERE id = ?',
        arguments: <dynamic>[value], mapper: _patientInfoMapper);
  }

  @override
  Future<List<int>> insertAllPatientInfo(List<PatientInfo> list) {
    return _patientInfoInsertionAdapter.insertListAndReturnIds(
        list, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> insertPatientInfo(PatientInfo patientInfo) async {
    await _patientInfoInsertionAdapter.insert(
        patientInfo, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> updateAllPatientInfo(List<PatientInfo> list) {
    return _patientInfoUpdateAdapter.updateListAndReturnChangedRows(
        list, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> updatePatientInfo(PatientInfo patientInfo) async {
    await _patientInfoUpdateAdapter.update(
        patientInfo, sqflite.ConflictAlgorithm.abort);
  }
}

class _$PatientsDao extends PatientsDao {
  _$PatientsDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _patientsInsertionAdapter = InsertionAdapter(
            database,
            'Patients',
            (Patients item) => <String, dynamic>{
                  'id': item.id,
                  'clinicId': item.clinicId,
                  'patientName': item.patientName,
                  'phone': item.phone,
                  'photo': item.photo,
                  'birthDate': item.birthDate,
                  'tall': item.tall,
                  'weight': item.weight,
                  'status': item.status,
                  'about': item.about,
                  'updatedBy': item.updatedBy,
                  'gender': item.gender,
                  'occupation': item.occupation
                }),
        _patientsUpdateAdapter = UpdateAdapter(
            database,
            'Patients',
            ['id'],
            (Patients item) => <String, dynamic>{
                  'id': item.id,
                  'clinicId': item.clinicId,
                  'patientName': item.patientName,
                  'phone': item.phone,
                  'photo': item.photo,
                  'birthDate': item.birthDate,
                  'tall': item.tall,
                  'weight': item.weight,
                  'status': item.status,
                  'about': item.about,
                  'updatedBy': item.updatedBy,
                  'gender': item.gender,
                  'occupation': item.occupation
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _patientsMapper = (Map<String, dynamic> row) => Patients(
      id: row['id'] as int,
      patientName: row['patientName'] as String,
      phone: row['phone'] as String,
      photo: row['photo'] as String,
      birthDate: row['birthDate'] as String,
      tall: row['tall'] as int,
      weight: row['weight'] as int,
      status: row['status'] as int,
      about: row['about'] as String,
      clinicId: row['clinicId'] as int,
      updatedBy: row['updatedBy'] as String,
      gender: row['gender'] as String,
      occupation: row['occupation'] as String);

  final InsertionAdapter<Patients> _patientsInsertionAdapter;

  final UpdateAdapter<Patients> _patientsUpdateAdapter;

  @override
  Future<List<Patients>> findAllPatients() async {
    return _queryAdapter.queryList('SELECT * FROM Patients',
        mapper: _patientsMapper);
  }

  @override
  Future<List<Patients>> findDataByValue(int value) async {
    return _queryAdapter.queryList('SELECT * FROM Patients WHERE id = ?',
        arguments: <dynamic>[value], mapper: _patientsMapper);
  }

  @override
  Future<List<int>> insertAllPatients(List<Patients> list) {
    return _patientsInsertionAdapter.insertListAndReturnIds(
        list, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> insertPatients(Patients patients) async {
    await _patientsInsertionAdapter.insert(
        patients, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> updateAllPatients(List<Patients> list) {
    return _patientsUpdateAdapter.updateListAndReturnChangedRows(
        list, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> updatePatients(Patients patients) async {
    await _patientsUpdateAdapter.update(
        patients, sqflite.ConflictAlgorithm.abort);
  }
}

class _$PatientsVisitsDao extends PatientsVisitsDao {
  _$PatientsVisitsDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _patientsVisitsInsertionAdapter = InsertionAdapter(
            database,
            'PatientsVisits',
            (PatientsVisits item) => <String, dynamic>{
                  'id': item.id,
                  'clinicId': item.clinicId,
                  'doctorId': item.doctorId,
                  'patientId': item.patientId,
                  'diagnosis': item.diagnosis,
                  'prescription': item.prescription,
                  'recommendations': item.recommendations,
                  'status': item.status,
                  'symptoms': item.symptoms,
                  'updatedBy': item.updatedBy,
                  'visitDate': item.visitDate,
                  'visitStatus': item.visitStatus,
                  'visitTime': item.visitTime
                }),
        _patientsVisitsUpdateAdapter = UpdateAdapter(
            database,
            'PatientsVisits',
            ['id'],
            (PatientsVisits item) => <String, dynamic>{
                  'id': item.id,
                  'clinicId': item.clinicId,
                  'doctorId': item.doctorId,
                  'patientId': item.patientId,
                  'diagnosis': item.diagnosis,
                  'prescription': item.prescription,
                  'recommendations': item.recommendations,
                  'status': item.status,
                  'symptoms': item.symptoms,
                  'updatedBy': item.updatedBy,
                  'visitDate': item.visitDate,
                  'visitStatus': item.visitStatus,
                  'visitTime': item.visitTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _patientsVisitsMapper = (Map<String, dynamic> row) =>
      PatientsVisits(
          clinicId: row['clinicId'] as int,
          diagnosis: row['diagnosis'] as String,
          doctorId: row['doctorId'] as int,
          id: row['id'] as int,
          patientId: row['patientId'] as int,
          prescription: row['prescription'] as String,
          recommendations: row['recommendations'] as String,
          status: row['status'] as int,
          symptoms: row['symptoms'] as String,
          updatedBy: row['updatedBy'] as String,
          visitDate: row['visitDate'] as String,
          visitStatus: row['visitStatus'] as String,
          visitTime: row['visitTime'] as String);

  final InsertionAdapter<PatientsVisits> _patientsVisitsInsertionAdapter;

  final UpdateAdapter<PatientsVisits> _patientsVisitsUpdateAdapter;

  @override
  Future<List<PatientsVisits>> findAllPatientsVisits() async {
    return _queryAdapter.queryList('SELECT * FROM PatientsVisits',
        mapper: _patientsVisitsMapper);
  }

  @override
  Future<List<PatientsVisits>> findDataByValue(int value) async {
    return _queryAdapter.queryList('SELECT * FROM PatientsVisits WHERE id = ?',
        arguments: <dynamic>[value], mapper: _patientsVisitsMapper);
  }

  @override
  Future<List<int>> insertAllPatientsVisits(List<PatientsVisits> list) {
    return _patientsVisitsInsertionAdapter.insertListAndReturnIds(
        list, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> insertPatientsVisits(PatientsVisits patientsVisits) async {
    await _patientsVisitsInsertionAdapter.insert(
        patientsVisits, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> updateAllPatientsVisits(List<PatientsVisits> list) {
    return _patientsVisitsUpdateAdapter.updateListAndReturnChangedRows(
        list, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> updatePatientsVisits(PatientsVisits patientsVisits) async {
    await _patientsVisitsUpdateAdapter.update(
        patientsVisits, sqflite.ConflictAlgorithm.abort);
  }
}

class _$PrescriptionOptionsDao extends PrescriptionOptionsDao {
  _$PrescriptionOptionsDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _prescriptionOptionsInsertionAdapter = InsertionAdapter(
            database,
            'PrescriptionOptions',
            (PrescriptionOptions item) => <String, dynamic>{
                  'id': item.id,
                  'clinicId': item.clinicId,
                  'createdAt': item.createdAt,
                  'createdBy': item.createdBy,
                  'medicineName': item.medicineName,
                  'status': item.status
                }),
        _prescriptionOptionsUpdateAdapter = UpdateAdapter(
            database,
            'PrescriptionOptions',
            ['id'],
            (PrescriptionOptions item) => <String, dynamic>{
                  'id': item.id,
                  'clinicId': item.clinicId,
                  'createdAt': item.createdAt,
                  'createdBy': item.createdBy,
                  'medicineName': item.medicineName,
                  'status': item.status
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _prescriptionOptionsMapper = (Map<String, dynamic> row) =>
      PrescriptionOptions(
          clinicId: row['clinicId'] as int,
          createdAt: row['createdAt'] as String,
          createdBy: row['createdBy'] as int,
          id: row['id'] as int,
          medicineName: row['medicineName'] as String,
          status: row['status'] as int);

  final InsertionAdapter<PrescriptionOptions>
      _prescriptionOptionsInsertionAdapter;

  final UpdateAdapter<PrescriptionOptions> _prescriptionOptionsUpdateAdapter;

  @override
  Future<List<PrescriptionOptions>> findAllPrescriptionOptions() async {
    return _queryAdapter.queryList('SELECT * FROM PrescriptionOptions',
        mapper: _prescriptionOptionsMapper);
  }

  @override
  Future<List<PrescriptionOptions>> findDataByValue(int value) async {
    return _queryAdapter.queryList(
        'SELECT * FROM PrescriptionOptions WHERE id = ?',
        arguments: <dynamic>[value],
        mapper: _prescriptionOptionsMapper);
  }

  @override
  Future<List<int>> insertAllPrescriptionOptions(
      List<PrescriptionOptions> list) {
    return _prescriptionOptionsInsertionAdapter.insertListAndReturnIds(
        list, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> insertPrescriptionOptions(
      PrescriptionOptions prescriptionOptions) async {
    await _prescriptionOptionsInsertionAdapter.insert(
        prescriptionOptions, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> updateAllPrescriptionOptions(List<PrescriptionOptions> list) {
    return _prescriptionOptionsUpdateAdapter.updateListAndReturnChangedRows(
        list, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> updatePrescriptionOptions(
      PrescriptionOptions prescriptionOptions) async {
    await _prescriptionOptionsUpdateAdapter.update(
        prescriptionOptions, sqflite.ConflictAlgorithm.abort);
  }
}

class _$RememberMeDao extends RememberMeDao {
  _$RememberMeDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _rememberMeInsertionAdapter = InsertionAdapter(
            database,
            'RememberMe',
            (RememberMe item) => <String, dynamic>{
                  'id': item.id,
                  'passWord': item.passWord,
                  'userName': item.userName
                }),
        _rememberMeUpdateAdapter = UpdateAdapter(
            database,
            'RememberMe',
            ['id'],
            (RememberMe item) => <String, dynamic>{
                  'id': item.id,
                  'passWord': item.passWord,
                  'userName': item.userName
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _rememberMeMapper = (Map<String, dynamic> row) => RememberMe(
      id: row['id'] as int,
      passWord: row['passWord'] as String,
      userName: row['userName'] as String);

  final InsertionAdapter<RememberMe> _rememberMeInsertionAdapter;

  final UpdateAdapter<RememberMe> _rememberMeUpdateAdapter;

  @override
  Future<List<RememberMe>> findAllRememberMe() async {
    return _queryAdapter.queryList('SELECT * FROM RememberMe',
        mapper: _rememberMeMapper);
  }

  @override
  Future<List<RememberMe>> findDataByValue(int value) async {
    return _queryAdapter.queryList('SELECT * FROM RememberMe WHERE id = ?',
        arguments: <dynamic>[value], mapper: _rememberMeMapper);
  }

  @override
  Future<List<int>> insertAllRememberMe(List<RememberMe> list) {
    return _rememberMeInsertionAdapter.insertListAndReturnIds(
        list, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> insertRememberMe(RememberMe rememberMe) async {
    await _rememberMeInsertionAdapter.insert(
        rememberMe, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> updateAllRememberMe(List<RememberMe> list) {
    return _rememberMeUpdateAdapter.updateListAndReturnChangedRows(
        list, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> updateRememberMe(RememberMe rememberMe) async {
    await _rememberMeUpdateAdapter.update(
        rememberMe, sqflite.ConflictAlgorithm.abort);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, dynamic>{
                  'id': item.id,
                  'clinicId': item.clinicId,
                  'createdAt': item.createdAt,
                  'email': item.email,
                  'job': item.job,
                  'password': item.password,
                  'phone': item.phone,
                  'photo': item.photo,
                  'role': item.role,
                  'specialization': item.specialization,
                  'status': item.status,
                  'theName': item.theName,
                  'updatedBy': item.updatedBy
                }),
        _userUpdateAdapter = UpdateAdapter(
            database,
            'User',
            ['id'],
            (User item) => <String, dynamic>{
                  'id': item.id,
                  'clinicId': item.clinicId,
                  'createdAt': item.createdAt,
                  'email': item.email,
                  'job': item.job,
                  'password': item.password,
                  'phone': item.phone,
                  'photo': item.photo,
                  'role': item.role,
                  'specialization': item.specialization,
                  'status': item.status,
                  'theName': item.theName,
                  'updatedBy': item.updatedBy
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _userMapper = (Map<String, dynamic> row) => User(
      clinicId: row['clinicId'] as int,
      createdAt: row['createdAt'] as String,
      email: row['email'] as String,
      id: row['id'] as int,
      job: row['job'] as int,
      password: row['password'] as String,
      phone: row['phone'] as String,
      photo: row['photo'] as String,
      role: row['role'] as int,
      specialization: row['specialization'] as String,
      status: row['status'] as int,
      theName: row['theName'] as String,
      updatedBy: row['updatedBy'] as String);

  final InsertionAdapter<User> _userInsertionAdapter;

  final UpdateAdapter<User> _userUpdateAdapter;

  @override
  Future<List<User>> findAllUser() async {
    return _queryAdapter.queryList('SELECT * FROM User', mapper: _userMapper);
  }

  @override
  Future<User> findDataByValue(int value) async {
    return _queryAdapter.query('SELECT * FROM User WHERE id = ?',
        arguments: <dynamic>[value], mapper: _userMapper);
  }

  @override
  Future<List<int>> insertAllUser(List<User> list) {
    return _userInsertionAdapter.insertListAndReturnIds(
        list, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> insertUser(User user) async {
    await _userInsertionAdapter.insert(user, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> updateAllUser(List<User> list) {
    return _userUpdateAdapter.updateListAndReturnChangedRows(
        list, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> updateUser(User user) async {
    await _userUpdateAdapter.update(user, sqflite.ConflictAlgorithm.abort);
  }
}

