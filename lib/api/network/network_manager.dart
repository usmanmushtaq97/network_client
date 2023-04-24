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
  NetWorkClient._privateConstructor();

  static final NetWorkClient _instance = NetWorkClient._privateConstructor();

  static NetWorkClient get instance => _instance;

  final token='';
  dynamic header;
  final _baseUrl = NetworkConfig().getBaseUrl();

  @override
  Future getApi(
      {required String url,
      bool loaderAllow = true,
      bool isAllowQueue = false,
      bool checkToken = true}) async {
    var response = await addToGet(
        url: url,
        loaderAllow: loaderAllow,
        checkToken: checkToken,
        isAllowQueue: isAllowQueue);

    return response;
  }

  @override
  Future postApi(
      {required String url,
      data,
      bool loaderAllow = false,
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

  /// add  data to post request
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
        AppLoader.instance.loaderShow();
      }
    }, onComplete: (data) {
      result = data;
      if (loaderAllow) {
        AppLoader.instance.loaderHide();
      }
    }, onError: () {
      if (loaderAllow) {
        AppLoader.instance.loaderHide();
      }
    });

    return result;
  }

  Future<void> httpPost(String url, dynamic data,
      {required Function() onStart,
      required Function(dynamic data) onComplete,
      required Function() onError,
      bool checkToken = true}) async {
    // this method we can recognize the request on start mode
    onStart();
    if (checkToken) {
      header = {
        HttpHeaders.contentTypeHeader: 'application/json',
       // HttpHeaders.acceptCharsetHeader:'*/*',
       // HttpHeaders.authorizationHeader: token.toString()
      };
    } else {
      header = {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptCharsetHeader:'*/*',};
    }
    var urlComplete = _baseUrl + url;
    appPrint('body############:${data.toString()}');
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
      setError('No internet', ErrorType.connectivity);
      throw ('No Internet Connection');
    }
  }

  /// Get Request request
  Future<dynamic> addToGet(
      {required String url,
      bool loaderAllow = true,
      bool isAllowQueue = false,
      bool checkToken = true}) async {
    // will be add request in Queue
    dynamic result;
    await httpGet(url, onStart: () {
      /// show loader on the start
      if (loaderAllow) {
        AppLoader.instance.loaderShow();
      }
    }, onComplete: (data) {
      result = data;
      if (loaderAllow) {
        AppLoader.instance.loaderHide();
      }
    }, onError: () {
      if (loaderAllow) {
        AppLoader.instance.loaderHide();
      }
    });

    return result;
  }

  Future<void> httpGet(String url,
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
    appPrint('DebugBase############:$_baseUrl');
    appPrint('DebugURl############:$url');
    appPrint('CompleteURl############:$urlComplete');
    appPrint('header############:$header');

    dynamic response;
    try {
      //response
      response = await analyticEngine(
          url: urlComplete, header: header, requestType: 'GET');
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
      setError('No internet', ErrorType.connectivity);
      throw ('No Internet Connection');
    }
  }
   /// process the response on the base
  /// onComplete method
  void _processResponse(http.Response response, url,
      {required Function onComplete, required Function onError}) async {
    switch (response.statusCode) {
      case 200:
        var data = jsonDecode(response.body);
        appPrint(
            'Response ######### URL: $url ###########  ResponseData: $data');
        if (data['code'] == 1) {
          onComplete(data);
        } else {
          onComplete(data);
        }
        break;
      case 400:
        onError("Error Message", ErrorType.internalServerError);
        break;
      case 500:
        onError("Bad Request Error", ErrorType.badRequest);
        break;
      case 404:
        onError("Message", ErrorType.internalServerError);
        break;
      default:
        onError(
            'Error with status code${response.statusCode}', ErrorType.unknown);
    }
  }

  /// This is a simple engin here we can handle type of request
  /// POST means post request
  ///  GET means get request
  Future<http.Response> analyticEngine(
      {required String url,
      required String requestType,
      dynamic body,
      dynamic header}) async {
    dynamic response;
    var requestData = jsonEncode(body);
    var completeUrl = Uri.parse(url);
    if (requestType == 'POST') {
      response = await http
          .post(completeUrl, body: requestData, headers: header)
          .timeout(const Duration(seconds: AppConstants.apiTimeOut));
    } else if (requestType == 'GET') {
      response = await getClient()
          .get(completeUrl, headers: header)
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
    print(errorMessage);
    // here I will add own logic for setup dialog
    // need to show error dialog
    //  network level  Error dialog
    //  using provider
  }
}
