
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medic_book/api/my_http_request.dart';
import 'package:medic_book/models/common.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RemoteDataSource {
  Future getData();
  }

class RemoteDataSourceImpl implements RemoteDataSource {
  final HttpClient httpClient;
  final MyHttpRequest myHttpRequest;
  final SharedPreferences sharedPreferences;

  RemoteDataSourceImpl({@required this.myHttpRequest,@required this.sharedPreferences,@required this.httpClient});

  Future getData() async {
 List<Response> response = await Future.wait([
   myHttpRequest.dio.get('/api/info/recommend'),
   myHttpRequest.dio.get('/api/info/popular?',
          queryParameters: {"index": 1, "size": 10}),
   myHttpRequest.dio.get('/api/info/hot',
          queryParameters: {"index": 1, "size": 10}),
    ]);
   return CommonDataList.fromJson(response[0].data['data']);
  }
}

