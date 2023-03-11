import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as api;

import 'network_exception.dart';

import 'response_handler.dart';

class API {
  //API client
  static var client = api.Client();

  static var header = {
    'Content-Type': 'application/json'
  };

  

  Future get(String url, header,{hideLog = false}) async {
    var responseJson;
    
    try {
      api.Response res;
      if (header != null) {
        res = await client.get(Uri.parse(url), headers: header,);
      } else {
        res = await client.get(Uri.parse(url));
      }
      responseJson = responseHandler(res, hideLog: hideLog);
    } on SocketException {
      //network error
      throw NetworkException("Network error occurred");
    }
    return responseJson;
  }

  Future post(String url, header, body, {FormData ?  multimediaRequest}) async {
    //await trythis();
    var responseJson;
    //If does not include files, use http request.
    if (multimediaRequest == null) {
      try {
        ///Log collected Info
        api.Response res = await client.post(Uri.parse(url), headers: header, body: body);
        responseJson = await responseHandler(res);
      } on SocketException {
        //network error
        throw NetworkException("Network error occurred");
      }
      return responseJson;
    }
    //If includes files, use dio request.
    else {
      Dio dio = Dio();
      try {
        Response res = await dio.post(
          url,
          data: multimediaRequest,
          options: Options(
            method: 'POST',
            contentType: "application/json",
            headers: header,
            responseType: ResponseType.plain,
          ),
          // onSendProgress: (int sent, int total) {
          //   log("Sent - $sent , Total : $total");
          // },
        );
        log(res.data);
        log("${res.statusCode}");
        return res.data;
      } on SocketException {
        throw NetworkException();
      } on DioError catch (e) {
        log(e.response.toString());
        log(e.response!.statusCode.toString());
        switch (e.response!.statusCode) {
          case 400:
            throw BadRequestException(e.response!.data);
          case 401:
          case 403:
            throw UnauthorisedException(e.response!.data);
          case 404:
            throw FileNotFoundException(e.response!.data);
          case 422:
            throw AlreadyRegisteredException(e.response!.data);
          case 500:
          default:
            throw FetchDataException(
                'Error occurred while Communication with Server with StatusCode : ${e.response!.statusCode}');
        }
      }
    }
  }

  Future put(String url, header, body, {FormData ? multimediaRequest}) async {
    var responseJson;
    if (multimediaRequest == null ) {
 try {
      var res = await client.put(Uri.parse(url), headers: header, body: body);
      responseJson = responseHandler(res);
    } on SocketException {
      //network error
      throw NetworkException("Network error occurred");
    }
    return responseJson;
    }
    else {
       Dio dio = Dio();
      try {
        Response res = await dio.put(
          url,
          data: multimediaRequest,
          options: Options(
            method: 'PUT',
            contentType: "application/json",
            headers: header,
            responseType: ResponseType.plain,
          ),
          // onSendProgress: (int sent, int total) {
          //   log("Sent - $sent , Total : $total");
          // },
        );
        log(res.data);
        log("${res.statusCode}");
        return res.data;
      }  on SocketException {
        throw NetworkException();
      } on DioError catch (e) {
        log(e.response.toString());
        log(e.response!.statusCode.toString());
        switch (e.response!.statusCode) {
          case 400:
            throw BadRequestException(e.response!.data);
          case 401:
          case 403:
            throw UnauthorisedException(e.response!.data);
          case 404:
            throw FileNotFoundException(e.response!.data);
          case 422:
            throw AlreadyRegisteredException(e.response!.data);
          case 500:
          default:
            throw FetchDataException(
                'Error occured while Communication with Server with StatusCode : ${e.response!.statusCode}');
        }
    }
   
  }
  }

  Future patch(String url, header, {body}) async {
    var responseJson;
    try {
      var res = await client.patch(Uri.parse(url), headers: header, body: body);
      responseJson = responseHandler(res);
    } on SocketException {
      //network error
      throw NetworkException("Network error occurred");
    }
    return responseJson;
  }

  Future delete(String url, header) async {
    var responseJson;
    try {
      var res = await client.delete(Uri.parse(url), headers: header);
      responseJson = responseHandler(res);
    } on SocketException {
      //network error
      throw NetworkException("Network error occurred");
    }
    return responseJson;
  }
}
