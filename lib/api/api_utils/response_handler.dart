import 'dart:developer';

import '../models/api_response.dart';
import 'network_exception.dart';
import 'package:http/http.dart' as api;

dynamic responseHandler(api.Response response, {bool hideLog = false}) async {
  //Attempt to derive error message
  String exceptionMsg;
  String exceptionCode;
  ApiResponse _responsebody;
  try {
    _responsebody = ApiResponse.fromJson(response.body);
    exceptionMsg = _responsebody.message!.toString();
    log("$_responsebody $exceptionMsg");
  } catch (e) {
    print("Error deriving error message: $e");
    exceptionMsg = response.body;
    // exceptionCode = response.statusCode.toString();
  }

  if (!hideLog) {
    print(response.body);
    print("status code: ${response}");
  }

  switch (response.statusCode) {
    case 201:
      return response.body;
    case 200:
      return response.body;

    case 400:
      throw BadRequestException(exceptionMsg);
    case 401:
      throw UnauthorisedException(exceptionMsg);
    case 403:
      throw UnauthorisedException(exceptionMsg);
    case 404:
      throw FileNotFoundException(exceptionMsg);
    case 422:
      //extract errors
      try {
        _responsebody = ApiResponse.fromJson(response.body);
        exceptionMsg = _responsebody.code!.toString();
      } catch (e) {
        print("could not extract errors");
      }

      throw AlreadyRegisteredException('$exceptionMsg');
    case 500:
    default:
      throw FetchDataException('${exceptionMsg}!');
  }
}
