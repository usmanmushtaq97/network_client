/**
 * Created by Muhammad Usman on 30/03/2023.
 * usmanmushtaq848@gmail.com
 */

abstract class BaseApiService{
  // get Method that for get request
  Future<dynamic> getApi(String url);
  // post method which is for post request
  Future<dynamic> postApi({required String url, dynamic data, bool loaderAllow=true, bool isAllowQueue=false, bool checkToken=true});


}