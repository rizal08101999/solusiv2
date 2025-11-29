
import 'dart:convert';

import 'package:dio/dio.dart' as dioo;

import '../../core/helper.dart';
import '../../core/local_db.dart';
import '../modules/home/model/home_model.dart';

class HomeRepositorys {
  final d = DioClient();

  Future<List<DashboardEntity>> getresume() async {
    List<DashboardEntity> result = [];
    const endpoint = "dashboard/get_data";

    Future<dioo.Response> getdata() async {
      return await d.dio.post(
        endpoint,
        data: {
          "id_employee" : LocalDB.user!.activeEmployee.idEmployee,
          "version": "",
          "device_id": "qwertyuiop"
        },
        options: dioo.Options(
          extra: {'withCredential': true},
        ),
      );
    }

    Future<void> handleResponse(dioo.Response response) async {
      final json = response.data is String ? jsonDecode(response.data) : response.data;
      await handleApiResponse<List<DashboardEntity>>(
        statusCode: response.statusCode,
        json: json,
        fromJson: (data) async {
          return (data as List).map((e) => DashboardEntity.fromJson(e as Map<String, dynamic>)).toList();
        },
        onSuccess: (datadashboard) async {
          result = datadashboard;
        },
        onFail: (msg) async {
          result = [];
        },
        defaultErrorMsg: "Gagal mendapatkan data",
      );
    }

    var response = await getdata();
    await handleResponse(response); // WAJIB pakai await!
    return result;
  }
}