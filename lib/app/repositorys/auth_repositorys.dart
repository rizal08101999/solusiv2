import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:solusi/core/helper.dart';

import '../../core/local_db.dart';
import '../modules/login/models/login_models.dart';
import '../modules/profile/models/profile_models.dart';

import 'package:dio/dio.dart' as dioo;

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
          "device_id": "qwertyuiop"
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

  Future<ProfileModels?> getProfileData() async {
    ProfileModels? result;
    const endpoint = "profile/get_data";

    Future<dioo.Response> getData() async {
      return await d.dio.post(
        endpoint,
        data: {
          "id_employee" : LocalDB.user!.activeEmployee.idEmployee,
          "device_id": "qwertyuiop",
        },
        options: dioo.Options(extra: {'withCredential': true}),
      );
    }

    Future<void> handleResponseData(dioo.Response response) async {
      final json = response.data is String ? jsonDecode(response.data) : response.data;
      if (!json['error']) {
        result = ProfileModels.fromJson(json);
      }
    }

    var response = await getData();
    await handleResponseData(response);
    return result;
  }
}