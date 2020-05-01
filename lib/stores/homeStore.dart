import 'package:medic_book/data/datasources/local/local_data_source.dart';
import 'package:medic_book/model/user.dart';
import 'package:mobx/mobx.dart';
import 'package:medic_book/api/my_http_request.dart';
import 'package:medic_book/models/common.dart';
import 'package:dio/dio.dart';

import '../injection_container.dart';

// Include generated file
part 'homeStore.changeG.dart';

class HomeStore = _HomeStore with _$HomeStore;

// The store-class
abstract class _HomeStore with Store {
  LocalDataSource localDataSource = sl<LocalDataSource>();

  @observable
  bool logedIn = false;
  @observable
  User user;
  // Recommended list
  @observable
  CommonDataList recommendData;
  // Version Information
  @observable
  VersionData versionData;

  @action
  bool checkLogIn() {
   logedIn =false;
    //logedIn = await localDataSource.checkLogedIn();
  }

  @action
  Future getUserInfo(int id) async {
    user = await localDataSource.getUsetInfo(id);
  }

  // Get version update notification
  @action
  Future getVersion() async {
    Response response = await MyHttpRequest().dio.get('/api/public/version');
    versionData = VersionData.fromJson(response.data);
  }
}

HomeStore $store = HomeStore();
