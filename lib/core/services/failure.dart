// import 'package:dio/dio.dart';

// abstract class Failure {
//   final String errMessage;

//   Failure(this.errMessage);
// }

// class ServerFauiler extends Failure {
//   ServerFauiler(super.errMessage);
//   factory ServerFauiler.fromDioError(DioError dioError) {
//     switch (dioError.type) {
//       case DioExceptionType.connectionTimeout:
//         return ServerFauiler('Connection time out with api server');
//       case DioExceptionType.sendTimeout:
//         return ServerFauiler('send time out with api server');

//       case DioErrorType.connectionError:
//         return ServerFauiler('Connection time out with api server');

//       case DioErrorType.receiveTimeout:
//         return ServerFauiler('Connection time out with api server');

//       case DioExceptionType.badResponse:
//         return ServerFauiler.fromResponse(
//             dioError.response!.statusCode!, dioError.response);
//       case DioExceptionType.cancel:
//         return ServerFauiler('request to api server was cancel');

//       case DioExceptionType.unknown:
//         if (dioError.message!.contains('SocketException')) {
//           return ServerFauiler('No Internet connection');
//         }
//         return ServerFauiler('Unexepcted error,please try again!');
//       default:
//         return ServerFauiler('opps there was an error,please try again!');
//     }
//   }
// //  status code

//   factory ServerFauiler.fromResponse(int statusCode, dynamic response) {
//     if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
//       return ServerFauiler(response['error']['message']);
//     } else if (statusCode == 404) {
//       return ServerFauiler('your request not found, please try later');
//     } else if (statusCode == 500) {
//       return ServerFauiler('internal server error,please try later');
//     } else if (statusCode == 503) {
//       return ServerFauiler('service unavaliable,please try later');
//     } else {
//       return ServerFauiler('opps there was an error,please try again');
//     }
//   }
// }
