import 'package:mobx/mobx.dart';
import 'package:medic_book/api/my_http_request.dart';
import 'package:dio/dio.dart';

// Include generated file
part 'registerStore.changeG.dart';

// This is the class used by rest of your codebase
class RegisterStore = _RegisterStore with _$RegisterStore;

// The store-class
abstract class _RegisterStore with Store {
  // User Info
  Map<String, String> reginterInfo = {
    'email': 'Flutter@email.com',
    'name': 'Flutter02',
    'password': '0123',
    'phone': '0123'
  };

  // Register a new user
  void handleRegister() async {
    print(reginterInfo);
    Response response = await MyHttpRequest().dio.post('/user/', data: reginterInfo);
    print(response);
  }

  @action
  void changeValue(String key, String value) {
    reginterInfo[key] = value;
  }
}
RegisterStore $store = RegisterStore();