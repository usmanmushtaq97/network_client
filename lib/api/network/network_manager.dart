//
// Created by Muhammad Usman on 30/03/2023.
// usmanmushtaq848@gmail.com
//

import 'dart:convert';
import 'dart:io';
import 'package:network_client/api/network/base_network.dart';
import 'package:http/http.dart' as http;
import 'package:network_client/config/network_config.dart';
import 'package:network_client/constants/app_constatns.dart';
import 'package:network_client/views/widgets/app_loader.dart';
import '../../constants/enums/error_type.dart';
import '../../helper/utils.dart';

class NetWorkClient extends BaseApiService {
  var token =
      'We can get the token in first call of api such as login and after first call the same token will be pass as general flow'; // here we will get token from stored value
  dynamic header;
  final _baseUrl = NetworkConfig().getBaseUrl();
  AppLoader appLoader = AppLoader();

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
      bool checkToken = true}) async {
    var response = await addToHttpPost(
        url: url,
        data: data,
        loaderAllow: loaderAllow,
        checkToken: checkToken,
        isAllowQueue: isAllowQueue);
    return response;
  }

  Future<dynamic> addToHttpPost(
      {required String url,
      data,
      bool loaderAllow = true,
      bool isAllowQueue = false,
      bool checkToken = true}) async {
    // will be add request in Queue
    dynamic result;
    await httpPost(url, data, onStart: () {
      /// show loader on the start
      if (loaderAllow) {
        appLoader.loaderShow();
      }
    }, onComplete: (data) {
      result = data;
      if (loaderAllow) {
        appLoader.loaderHide();
      }
    }, onError: () {
      if (loaderAllow) {
        appLoader.loaderHide();
      }
    });

    return result;
  }

  Future<void> httpPost(String url, dynamic data,
      {required Function onStart,
      required Function onComplete,
      required Function onError,
      bool checkToken = true}) async {
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
    var urlComplete = _baseUrl + url;
    appPrint('body############:$data');
    appPrint('DebugBase############:$_baseUrl');
    appPrint('DebugURl############:$url');
    appPrint('CompleteURl############:$urlComplete');
    appPrint('header############:$header');

    dynamic response;
    try {
      //response
      response = await analyticEngine(
          url: urlComplete, body: data, header: header, requestType: 'POST');
      // process the data  the response
      _processResponse(response, url, onComplete: (data) {
        var result = data;
        onComplete(result);
      }, onError: (errorMessage, errorType) {
        // set the error
        onError();
        setError(errorMessage, errorType);
      });
      appPrint('Response############:$response');
    } on SocketException {
      throw ('No Internet Connection');
    }
  }

  void _processResponse(http.Response response, url,
      {required Function onComplete, required Function onError}) async {
    switch (response.statusCode) {
      case 200:
        var data = jsonDecode(response.body);
        appPrint(
            'Response ######### URL: $url ###########  ResponseData: $data');
        if (data['code'] == 0) {
          onComplete(data);
        } else {
          onComplete(data);
        }
        break;
      case 400:
        onError("Error Message", ErrorType.internalServerError);
        break;
      case 500:
        onError("Bad Request Error", ErrorType.internalServerError);
        break;
      case 404:
        onError("Message", ErrorType.badRequest);
        break;
      default:
        onError('with status code${response.statusCode}', ErrorType.unknown);
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
    } else if (requestType == 'GET') {
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

  // set Error for dialog purpose
  void setError(var errorMessage, ErrorType errorType) {
    // here I will add own logic for setup dialog and pop
  }
}
