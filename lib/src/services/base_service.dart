import 'dart:convert';
import 'package:dio/dio.dart';

class BaseService {

  late final Dio client;

  BaseService({Dio? client}) {
    this.client = client ?? Dio();
  }

  dynamic decode({required Response<dynamic> response}) {
    return jsonDecode(response.data);
  }
}
