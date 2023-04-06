//
// Created by Muhammad Usman on 30/03/2023.
// usmanmushtaq848@gmail.com
//

import 'dart:io';
import 'package:network_client/api/network/base_network.dart';
import 'package:http/http.dart' as http;
import '../../helper/utils.dart';
class NetWorkClient extends BaseApiService {
  var token = 'We can get the token in first call of api such as login and after first call the same token will be pass as general flow'; // here we will get token from stored value
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
    //response
    dynamic response = analyticEngine(
        url: url, body: data, header: header, requestType: 'POST');
  }

  Future<dynamic> _processResponse() async {
    switch (4) {

    }
  }
  /// This is a simple engin here we can handle type of request
  Future<dynamic> analyticEngine(
      {required url,
      required String requestType,
      dynamic body,
      dynamic header}) async {
    dynamic response;
    response = await http
        .post(url, body: body, headers: header)
        .timeout(const Duration(seconds: 90));
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
