import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../../services/device_preferences.dart';
import '../../services/user_global_state.dart';
import '../../exceptions/api_exception.dart';

final apiControllerProvider = Provider((ref) {
  final lang = ref.watch(settingProvider).locale.languageCode;
  final token = ref.watch(userGlobalStateProvider).token;
  return ApiController(lang: lang, token: token);
});

class ApiController {
  ApiController({String? token, String? lang}) {
    addAuthHeaders(token: token, lang: lang);
  }

  Map<String, String> headers = {
    'Accept': 'application/json',
    'content-type': 'application/json; charset=utf-8',
    'lang': 'en'
  };

  void addAuthHeaders({
    String? token,
    String? lang,
  }) {
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    if (lang != null) {
      headers['lang'] = lang;
    }
  }

  Future<dynamic> get(url) async {
    debugPrint('Api Get, url $url');
    try {
      return await http.get(url, headers: headers);
    } on SocketException {
      throw InternetConnectionException();
    }
  }

  Future<dynamic> post(url, Map<String, dynamic> body) async {
    debugPrint('Api Post, url $url');
    try {
      return await http.post(url, body: jsonEncode(body), headers: headers);
    } on SocketException {
      throw InternetConnectionException();
    }
  }

  Future<dynamic> put(url, Map<String, dynamic> body) async {
    debugPrint('Api Put, url $url');
    try {
      return await http.put(url, body: jsonEncode(body), headers: headers);
    } on SocketException {
      throw InternetConnectionException();
    }
  }

  Future<dynamic> delete(url, Map<String, dynamic> body) async {
    debugPrint('Api delete, url $url');
    try {
      return await http.delete(url, body: jsonEncode(body), headers: headers);
    } on SocketException {
      throw InternetConnectionException();
    }
  }

  Future<dynamic> multipartRequest(
      Uri url, Map<String, String> body, List<http.MultipartFile> files,
      {String method = 'POST',void Function(int, int)? onProgress}) async {
    debugPrint('Api $method, url $url');
    dynamic responseJson;
    try {
      var request = http.MultipartRequest(method, url);
      for (var f in files) {
        request.files.add(f);
      }
      request.fields.addAll(body);
      request.headers.addAll(headers);

      http.StreamedResponse responseStreamed = await request.send().timeout(
            const Duration(seconds: 60),
            onTimeout: () =>
                throw FetchDataException('Time Out While Connection'),
          );

      responseJson = await http.Response.fromStream(responseStreamed);
    } on SocketException {
      throw InternetConnectionException();
    }
    return responseJson;
  }
}

class UploadFileHelper {
  final List<int> stream;
  String fieldName = 'file';
  final String? path;
  final String fileName;
  final int length;
  UploadFileHelper(
    this.stream,
    this.fileName,
    this.length,
    this.path,
  );

  String get lengthInMB {
    double sizeInMb = length / (1024 * 1024);
    return "${sizeInMb.toStringAsFixed(3)} MB";
  }
}




class CustomMultipartRequest extends http.MultipartRequest {
  CustomMultipartRequest(
      String method,
      Uri url, {
         this.onProgress,
      }) : super(method, url);

  final void Function(int bytes, int totalBytes)? onProgress;

  @override
  http.ByteStream finalize() {
    final byteStream = super.finalize();
    if (onProgress == null) return byteStream;

    final total = contentLength;
    int bytes = 0;

    final t = StreamTransformer.fromHandlers(
      handleData: (List<int> data, EventSink<List<int>> sink) {
        bytes += data.length;
        onProgress!(bytes, total);
        if(total >= bytes) {
          sink.add(data);
        }
      },
    );
    final stream = byteStream.transform(t);
    return http.ByteStream(stream);
  }
}
