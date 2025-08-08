// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:solusi/core/local_db.dart';

final log = Logger();
const baseUrl = "https://lotusku.com/apimobile/";

Future<T?> handleApiResponse<T>({
  required int? statusCode,
  required dynamic json,
  Future<T> Function(dynamic data)? fromJson,
  Future<void> Function(T data)? onSuccess,
  Future<void> Function(String msg)? onSuccessMsg,
  Future<void> Function(String msg)? onFail,
  Future<void> Function()? onBadResponse,
  String? defaultErrorMsg,
  Future<void> Function()? onUnauthorized,
}) async {
  print("statusCode: $statusCode");
  switch (statusCode) {
    case 200:
      if (json['error'] == true) {
        await onFail?.call(json['message'] ?? defaultErrorMsg ?? "Terjadi kesalahan.");
        return null;
      } else {
        if (fromJson != null) {
          final data = await fromJson(json['data']);
          await onSuccess?.call(data);
          return data;
        } else if (onSuccessMsg != null) {
          await onSuccessMsg.call(json['message'] ?? "Berhasil.");
          return null;
        } else {
          await onSuccess?.call(json);
          return null;
        }
      }
    case 201:
      if (json['error'] == true) {
        await onFail?.call(json['message'] ?? defaultErrorMsg ?? "Terjadi kesalahan.");
        return null;
      } else {
        if (fromJson != null) {
          final data = await fromJson(json['data']);
          await onSuccess?.call(data);
          return data;
        } else if (onSuccessMsg != null) {
          await onSuccessMsg.call(json['message'] ?? "Berhasil.");
          return null;
        } else {
          await onSuccess?.call(json);
          return null;
        }
      }
    case 400:
      print("objectku");
      await onBadResponse?.call();
      return null;
    case 401:
      await onUnauthorized?.call();
      await onFail?.call(json['message'] ?? "Tidak diizinkan.");
      return null;
    case 404:
      await onFail?.call(json['message'] ?? "Data tidak ditemukan.");
      return null;
    default:
      await onFail?.call(defaultErrorMsg ?? "Terjadi kesalahan.");
      return null;
  }
}

class DioClient {
  late Dio dio;

  DioClient() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
      contentType: Headers.formUrlEncodedContentType
    );
    

    dio = Dio(options);

    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      logPrint: (obj) => log.i(obj),
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await getToken(); 
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) {
        log.e("API Error", error: e, stackTrace: e.stackTrace);
        return handler.next(e);
      },
    ));
  }

  Future<String?> getToken() async {
    if (LocalDB.getToken() != null) {
      return LocalDB.getToken()!;
    } else {
      return null;
    }
  }

  Future<Response> postMultipart({
    required String path,
    required Map<String, dynamic> fields,
    required List<MultipartFile> files,
    required List<String> filePaths, // Tambahan: path asli dari file
    required String paramsimage,
  }) async {
    final formData = FormData();

    fields.forEach((key, value) {
      formData.fields.add(MapEntry(key, value.toString()));
    });

    for (int i = 0; i < files.length; i++) {
      formData.files.add(MapEntry('$paramsimage[$i]', files[i]));
    }

    return await dio.post(
      path,
      data: formData,
      options: Options(
        contentType: 'multipart/form-data',
      ),
    );
  }

}


Future<String?> getDeviceId() async {
  const platform = MethodChannel('device/info');
  try {
    return await platform.invokeMethod('deviceId');
  } catch (e) {
    return '';
  }
}

Future<void> startTrackingDelivery(String shipmentId) async {
  const MethodChannel channel = MethodChannel('location/channel');
  try {
    final result = await channel.invokeMethod('startTracking', {
      'shipmentId': shipmentId,
    });
    print("Service started: $result");
  } on PlatformException catch (e) {
    print("Failed to start tracking: ${e.message}");
  }
}

Future<void> stopTrackingDelivery() async {
  const MethodChannel channel = MethodChannel('location/channel');
  try {
    final result = await channel.invokeMethod('stopTracking',);
    print("Service stopped: $result");
  } on PlatformException catch (e) {
    print("Failed to stopped tracking: ${e.message}");
  }
}



