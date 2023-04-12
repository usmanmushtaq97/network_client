//
// Created by Muhammad Usman on 11/04/2023.
//usmanmushtaq848@gmail.com
//


import '../../constants/_constants.dart';
class NetWorkApiResponse<T> {

  Status? status ;
  T? data ;
  String? message ;

  NetWorkApiResponse(this.status , this.data, this.message);


  NetWorkApiResponse.loading(this.message) : status = Status.LOADING ;

  NetWorkApiResponse.onCompleted(this.data) : status = Status.COMPLETED ;

  NetWorkApiResponse.onError(this.data) : status = Status.ERROR ;


  @override
  String toString(){
    return "Status : $status \n Message : $message \n Data: $data" ;
  }


}