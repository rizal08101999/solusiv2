import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:solusi/core/helper.dart';

import '../../core/local_db.dart';
import '../modules/login/models/login_models.dart';

class AuthRepositorys {
  String codeotp = "";
  String msgfail = "";
  String msgsuccsess = "";
  String title = "";
  final d = DioClient();

  Future<bool> doLogin({required String username, required String password}) async {
    const endpoint = "login/do_log";
    await getDeviceId().then((value) => LocalDB.setDeviceId(value!),);
    bool result = false;
    try {
      var response = await d.dio.post(
        endpoint,
        data: {
          "username": username,
          "password": password,
          "firebase_token": "",
          "device_id": LocalDB.getDeviceId() ?? ""
        },
      );
      final json = response.data is String ? jsonDecode(response.data) : response.data;
      await handleApiResponse<UserEntity>(
        statusCode: response.statusCode,
        json: json,
        fromJson: (data) async {
          return UserEntity.fromJson(data);
        },
        onSuccess: (userdata) async {
          LocalDB.user = userdata;
          debugPrint("data ${LocalDB.user}");
          LocalDB.setToken(LocalDB.user!.token);
          result = false;
        },
        onFail: (msg) async {
          msgfail = json['msg'];
          result = true;
        },
        onBadResponse: () async {
          title = json['msg'] == "Password anda salah" ? "" : "Akun Belum Dikonfirmasi";
          msgfail = json['msg'] == "Email tidak terdaftar" ? "Email ini belum terdaftar. Silakan gunakan email lain atau daftar terlebih dahulu" : json['msg'];
          result = true;
        },
        defaultErrorMsg: "Login Gagal",
      );
    } catch (e) {
      msgfail = "Permintaan gagal diproses. Coba beberapa saat lagi.";
      result = true;
    }
    return result;
  }
}