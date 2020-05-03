import 'package:medic_book/data/datasources/local/entrance.local_data_source.dart';
import 'package:medic_book/model/user.dart';
import 'package:mobx/mobx.dart';
import 'package:medic_book/api/my_http_request.dart';
import 'package:medic_book/models/common.dart';
import 'package:dio/dio.dart';

import '../injection_container.dart';

// Include generated file
part 'homeStore.g2.dart';

class HomeStore = _HomeStore with _$HomeStore;

// The store-class
abstract class _HomeStore with Store {
  LocalDataSource localDataSource = sl<LocalDataSource>();

  @observable
  bool logedIn = false;
  @observable
  bool secondEnter = false;
  @observable
  int pageIndex = 0;

  @observable
  User user;
  // Recommended list
  @observable
  CommonDataList recommendData;

  @action
  bool setPageIndex(int index) {
    pageIndex =index;
    //logedIn = await localDataSource.checkLogedIn();
  }
  @action
  bool checkLogIn() {
    logedIn=localDataSource.checkLogedIn();
  }
  @action
  bool checkIsSecondEnter() {
    print("homeState secondInter =${localDataSource.secondEnter().toString()}");
    secondEnter=localDataSource.secondEnter();
  }
  @action
  Future getUserInfo(int id) async {
    user = await localDataSource.getUsetInfo(id);
  }

}

HomeStore $store = HomeStore();
