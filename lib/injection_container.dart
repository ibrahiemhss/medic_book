import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import 'api/my_http_request.dart';
import 'api/network_info.dart';
import 'api/network_info_impl.dart';
import 'data/database/database.dart';
import 'data/datasources/local/entrance.local_data_source.dart';
import 'data/datasources/remote/remote_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<MyHttpRequest>(() => MyHttpRequest());

 // final sharedPreferences = await SharedPreferences.getInstance();
  //sl.registerLazySingleton(() => sharedPreferences);

  //init tools
  //AppDatabase appDatabase = await $FloorAppDatabase.databaseBuilder('medicBook.db').build();
 // sl.registerLazySingleton(() => appDatabase);
  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      httpClient: sl(),
     // sharedPreferences: sl(),
      myHttpRequest: sl(),
    ),
  );
  sl.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(
        //sharedPreferences: sl(),
       // appDatabase: sl()),
  ));
}
