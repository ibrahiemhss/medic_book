import 'package:dio/dio.dart';
import 'package:medic_book/helpers/constants.dart';

class MyHttpRequest {
  final Dio dio = Dio();

  MyHttpRequest() {
    // api address
    dio.options.baseUrl = Urls.baseURL;
    // Request timeout
    dio.options.receiveTimeout = 15000;
    // Add interceptor
    dio.interceptors
      ..add(InterceptorsWrapper(onRequest: (RequestOptions options) {
        print('Join token>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
        // Request to join token
        options.headers["csrfToken"] = 'csrfToken';
        return options;
      }, onResponse: (Response response) {
        print('onResponse------------------');
        // Do some preprocessing before returning the response data
        return response;
      }, onError: (DioError error) {
        print('---------------->>>>>>>>>>>>>>>>>>error');
        print(error);
        // Do some preprocessing when the request fails
        return error; //continue
      }))
      ..add(LogInterceptor());
  }
}
