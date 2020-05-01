import 'package:mobx/mobx.dart';
import 'package:medic_book/api/my_http_request.dart';
import 'package:dio/dio.dart';

// Include generated file
part 'loginStore.changeG.dart';

// This is the class used by rest of your codebase
class LoginStore = _LoginStore with _$LoginStore;

// The store-class
abstract class _LoginStore with Store {
  @observable
  bool tile = false;

  @observable
  num count = 10;

  @action
  void setTile(String key, dynamic value) => tile = value;

  @action
  num counter() => this.count++;

  @action
  void getInfo() async {
    Response response = await MyHttpRequest().dio.get('http://api.soscoon.com/playlist/hot');
    print(response);
  }
}
LoginStore $store = LoginStore();