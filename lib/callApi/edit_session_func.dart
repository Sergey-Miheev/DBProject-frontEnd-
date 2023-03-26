import 'dart:core';
import 'package:dio/dio.dart';
import '../models/session.dart';
import 'constants.dart';

String refUrl = 'editSession';

Future<Session?> editSession(Session? session) async {
  try {
    String dateTime = session!.dateTime.toString();
    dateTime = "${dateTime.substring(0, 10)}T${dateTime.substring(11, 19)}";
    print(dateTime);
    if (session != null) {
      Response response = await Dio().put('$baseUrl$refUrl', data: {
        'idSession': session.idSession,
        'idFilm': session.idFilm,
        'idHall': session.idHall,
        'dateTime': dateTime,
      });
      print(response.data.toString());
      print("Ura");
      return Session.fromJson(response.data);
    }
    return null;
  } on DioError catch (e) {
    if (e.response != null) {
      print(e.response!.data);
    } else {
      print(e.requestOptions);
      print(e.message);
    }
    return null;
  }
}