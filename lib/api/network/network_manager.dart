//
// Created by Muhammad Usman on 30/03/2023.
// usmanmushtaq848@gmail.com
//

import 'dart:convert';
import 'dart:io';
import 'package:network_client/api/network/base_network.dart';
import 'package:http/http.dart' as http;
import 'package:network_client/constants/app_constatns.dart';
import '../../helper/utils.dart';

class NetWorkClient extends BaseApiService {
  var token =
      'We can get the token in first call of api such as login and after first call the same token will be pass as general flow'; // here we will get token from stored value
  dynamic header;

  @override
  Future getApi(String url) {
    // TODO: implement getApi
    throw UnimplementedError();
  }

  @override
  Future postApi(
      {required String url,
      data,
      bool loaderAllow = true,
      bool isAllowQueue = false,
      bool checkToken = true}) {
    // TODO: implement postApi
    throw UnimplementedError();
  }

  Future<dynamic> addToHttpPost(
      {required String url,
      data,
      bool loaderAllow = true,
      bool isAllowQueue = false,
      bool checkToken = true}) async {
    // will be add request in Queue
  }

  Future<dynamic> httpPost(String url, dynamic data, Function onStart,
      Function onComplete, Function onError,
      {bool checkToken = true}) async {
    // this method we can recognize the request on start mode
    onStart();
    if (checkToken) {
      header = {
        HttpHeaders.acceptCharsetHeader: 'application/json',
        HttpHeaders.authorizationHeader: token.toString()
      };
    } else {
      header = {HttpHeaders.acceptCharsetHeader: 'application/json'};
    }
    appPrint('body############:$data');
    appPrint('DebugURl############:$url');
    appPrint('header############:$header');

    dynamic response;
    try {
      //response
      response = await analyticEngine(
          url: url, body: data, header: header, requestType: 'POST');
    response =  await _processResponse(response, url, onComplete, onError);
    } on SocketException {
      throw ('No Internet Connection');
    }

    return response;
  }

  dynamic _processResponse(http.Response response, url,
      Function onComplete, Function onError) async {
    // required onError need set lot of things that I will when i free from office  hope this I will complete this network client for  use
    switch (response.statusCode) {
      case 200:
        var data = jsonDecode(response.body);
        if (data['code'] == 0) {
          onComplete(data);
        }
        return data;
      case 400:
        onError("Message", 400);
        break;
      case 500:
        onError("Message", 500);
        break;
      case 404:
        onError("Message", 404);
        break;
    }

  }

  /// This is a simple engin here we can handle type of request
  /// POST means post request
  ///  GET means get request
  Future<http.Response> analyticEngine(
      {required url,
      required String requestType,
      dynamic body,
      dynamic header}) async {
    dynamic response;
    if (requestType == 'POST') {
      response = await getClient()
          .post(url, body: body, headers: header)
          .timeout(const Duration(seconds: AppConstants.apiTimeOut));
    } else {
      response = await getClient()
          .get(url, headers: header)
          .timeout(const Duration(seconds: 90));
    }
    return response;
  }

  /// http client is handle all even mutiple request going on server at same time
  /// for handle error exception I'm using this
  /// simple  use getClient()
  http.Client getClient() {
    var client = http.Client();
    try {
      client = http.Client();
    } catch (e) {
      appPrint(e.toString());
    }
    return client;
  }
}
