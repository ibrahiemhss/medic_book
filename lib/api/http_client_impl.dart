import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'http_client.dart';
import 'my_http_request.dart';

class HttpClientImpl implements HttpClient {

  @override
   get(String url, {Map<String, dynamic> headers})  async {

    var uri = Uri.parse(url);
    var response;
    try{
      response= await MyHttpRequest().dio
          .get(uri.toString());
    }catch(e){
      print("HTTP DIO EXCEPTION ${e.toString()}");
    }

    return response.data;
//          .then((decoded) => print(decoded))
//          .catchError((error) => print("GET Exeption =\n${error.toString()}"));
  }

  @override
   post(String url, {Map<String, dynamic> headers}) async{
    final fromData=FormData.fromMap(headers);
    var uri = Uri.parse(url);
    var response;
    response= await MyHttpRequest().dio
        .post(uri.toString(),data:fromData );
    return response.data;

  }
}
