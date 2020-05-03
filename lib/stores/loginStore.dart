import 'package:medic_book/data/datasources/local/entrance.local_data_source.dart';
import 'package:mobx/mobx.dart';
import 'package:medic_book/api/my_http_request.dart';
import 'package:dio/dio.dart';

import '../injection_container.dart';

// Include generated file
part 'loginStore.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

// The store-class
abstract class _LoginStore with Store {
  LocalDataSource localDataSource = sl<LocalDataSource>();

  @observable
  bool tile = false;

  @observable
  num count = 10;

  @action
  void setTile(String key, dynamic value) => tile = value;

  @action
  num counter() => this.count++;

  @action
  Future getInfo() async {
    Response response =
        await MyHttpRequest().dio.get('http://api.soscoon.com/playlist/hot');
    print(response);
  }

  @action
  void setSecondEnter(bool enter)  {

    localDataSource.setSecondEnter(enter);
  }
}

LoginStore $store = LoginStore();
