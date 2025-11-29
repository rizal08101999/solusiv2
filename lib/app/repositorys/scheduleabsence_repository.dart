import 'dart:convert';
import 'package:dio/dio.dart' as dioo;
import 'package:solusi/app/modules/schedule/model/schedule_model.dart';
import 'package:solusi/core/helper.dart';
import 'package:solusi/core/local_db.dart';

import '../modules/absensi/model/absensi_model.dart';
import '../modules/absensi/model/absen_status_model.dart';
import '../modules/history/model/history_model.dart';

class ScheduleAbsenceRepository {
  final d = DioClient();
  String msgfail = "";

  Future<List<ScheduleEntity>> getScheduleData() async {
    List<ScheduleEntity> result = [];
    const endpoint = "employee/get_schedule";

    Future<dioo.Response> getData() async {
      return await d.dio.post(
        endpoint,
        data: {
          "id_employee": LocalDB.user!.activeEmployee.idEmployee,
          "device_id": "qwertyuiop",
        },
        options: dioo.Options(extra: {'withCredential': true}),
      );
    }

    Future<void> handleResponse(dioo.Response response) async {
      final json = response.data is String ? jsonDecode(response.data) : response.data;
      await handleApiResponse<List<ScheduleEntity>>(
        statusCode: response.statusCode,
        json: json,
        fromJson: (data) async => (data as List).map((e) => ScheduleEntity.fromJson(e)).toList(),
        onSuccess: (data) async => result = data,
        onFail: (msg) async => result = [],
        defaultErrorMsg: "Gagal mendapatkan data jadwal",
      );
    }

    var response = await getData();
    await handleResponse(response);
    return result;
  }

  Future<List<AbsensiModel>> getAbsense({String? date}) async {
    List<AbsensiModel> result = [];
    const endpoint = "absensi/history/get_data";

    Future<dioo.Response> getData() async {
      return await d.dio.post(
        endpoint,
        data: {
          "id_employee": LocalDB.user!.activeEmployee.idEmployee,
          "start_date": date ?? formatedateapi.format(DateTime.now()),
          "device_id": "qwertyuiop",
        },
        options: dioo.Options(extra: {'withCredential': true}),
      );
    }

    Future<void> handleResponse(dioo.Response response) async {
      final rawJson = response.data is String ? jsonDecode(response.data) : response.data;
      final dataList = rawJson["data"] as List;
      final first = dataList.isNotEmpty ? dataList.first : null;
      final extracted = first?["data_absensi"] ?? [];
      await handleApiResponse<List<AbsensiModel>>(
        statusCode: response.statusCode,
        dataKey: null, // Tidak perlu pakai key, kita sudah extract manual
        json: {"data": extracted}, // triknya: bungkus jadi Map agar handler tetap aman
        fromJson: (data) async => (data as List).map((e) => AbsensiModel.fromJson(e)).toList(),
        onSuccess: (data) async => result = data,
        onFail: (msg) async => result = [],
        defaultErrorMsg: "Gagal mendapatkan data absensi",
      );
    }

    var response = await getData();
    await handleResponse(response);
    return result;
  }

  Future<List<HistoryModel>> getHistoryAbsensiByRange(String startDate, String endDate) async {
    List<HistoryModel> result = [];
    const endpoint = "absensi/history/get_data";

    Future<dioo.Response> getData() async {
      return await d.dio.post(
        endpoint,
        data: {
          "id_employee": LocalDB.user!.activeEmployee.idEmployee,
          "start_date": startDate,
          "end_date": endDate,
          "device_id": "qwertyuiop",
        },
        options: dioo.Options(extra: {'withCredential': true}),
      );
    }

    Future<void> handleResponse(dioo.Response response) async {
      final json = response.data is String ? jsonDecode(response.data) : response.data;
      await handleApiResponse<List<HistoryModel>>(
        statusCode: response.statusCode,
        json: json,
        fromJson: (data) async => (data as List).map((e) => HistoryModel.fromJson(e)).toList(),
        onSuccess: (data) async => result = data,
        onFail: (msg) async => result = [],
        defaultErrorMsg: "Gagal mendapatkan data riwayat absensi",
      );
    }

    var response = await getData();
    await handleResponse(response);
    return result;
  }

  Future<LocationEntity?> getLocationAbsence() async {
    LocationEntity? result;
    const endpoint = "absensi/get_location_absensi";

    Future<dioo.Response> getData() async {
      return await d.dio.post(
        endpoint,
        data: {
          "id_employee": LocalDB.user!.activeEmployee.idEmployee,
          "device_id": "qwertyuiop",
        },
        options: dioo.Options(extra: {'withCredential': true}),
      );
    }

    Future<void> handleResponse(dioo.Response response) async {
      final json = response.data is String ? jsonDecode(response.data) : response.data;
      
      if (json['error'] == false && json['data'] != null) {
        // Create LocationEntity from the response
        final locationEntity = LocationEntity(
          freeGeo: json['free_geo']?.toString() ?? '0',
          labelFreeGeo: json['label_free_geo']?.toString() ?? '',
          error: json['error'] ?? true,
          data: (json['data'] as List<dynamic>).map((item) => DataLocation(
            id: item['id']?.toString() ?? '',
            name: item['name']?.toString() ?? '',
            lat: item['lat']?.toString() ?? '0',
            lng: item['lng']?.toString() ?? '0',
            distance: item['distance']?.toString() ?? '0',
          )).toList(),
        );
        result = locationEntity;
      } else {
        result = null;
      }
    }

    var response = await getData();
    await handleResponse(response);
    return result;
  }

  Future<Map<String, dynamic>> getLocationRepo() async {
    const endpoint = "absensi/get_location_absensi";

    final response = await d.dio.post(
      endpoint,
      data: {
        "id_employee": LocalDB.user!.activeEmployee.idEmployee,
        "device_id": "qwertyuiop",
      },
      options: dioo.Options(extra: {'withCredential': true}),
    );

    return response.data is String ? jsonDecode(response.data) : response.data;
  }

  Future<bool> saveAbsence({
    required double lat,
    required double lng,
    required String type,
    required String location,
    required String isFree,
    String? photoPath,
  }) async {
    bool result = false;
    const endpoint = "absensi/save_absen";

    Future<dioo.Response> postData() async {
      if (photoPath != null && photoPath.isNotEmpty) {
        // Use multipart for photo upload
        final formData = dioo.FormData.fromMap({
          "id_employee": LocalDB.user!.activeEmployee.idEmployee,
          "id_user": LocalDB.user!.idUser,
          "lat": lat.toString(),
          "lng": lng.toString(),
          "type_absen": type,
          "is_freegeo": isFree,
          "file": await dioo.MultipartFile.fromFile(photoPath, filename: "absensi_photo.jpg"),
          "device_id": "qwertyuiop",
          "date": formatedateapi.format(DateTime.now()),
        });
        
        return await d.dio.post(
          endpoint,
          data: formData,
          options: dioo.Options(
            contentType: 'multipart/form-data',
            extra: {'withCredential': true},
          ),
        );
      } else {
        // Regular post without photo
        return await d.dio.post(
          endpoint,
          data: {
            "id_employee": LocalDB.user!.activeEmployee.idEmployee,
            "id_user": LocalDB.user!.idUser,
            "lat": lat.toString(),
            "lng": lng.toString(),
            "type_absen": type,
            "is_freegeo": isFree,
            "device_id": "qwertyuiop",
            "date": formatedateapi.format(DateTime.now()),
          },
          options: dioo.Options(extra: {'withCredential': true}),
        );
      }
    }

    Future<void> handleResponse(dioo.Response response) async {
      final json = response.data is String ? jsonDecode(response.data) : response.data;
      await handleApiResponse<bool>(
        statusCode: response.statusCode!,
        json: json,
        onSuccessMsg: (msg) async {
          result = true;
        },
        onFail: (msg) async {
          msgfail = msg;
          result = false;
        },
        defaultErrorMsg: "Gagal menyimpan data absensi",
      );
    }

    var response = await postData();
    await handleResponse(response);
    return result;
  }

  Future<bool> saveAbsenceOut({
    required double lat,
    required double lng,
    required String type,
    required String location,
    required String isFree,
    required String absenceId,
    String? photoPath,
  }) async {
    bool result = false;
    const endpoint = "absensi/save_absen";

    Future<dioo.Response> postData() async {
      if (photoPath != null && photoPath.isNotEmpty) {
        // Use multipart for photo upload
        final formData = dioo.FormData.fromMap({
          "id_employee": LocalDB.user!.activeEmployee.idEmployee,
          "id_user": LocalDB.user!.idUser,
          "lat": lat.toString(),
          "lng": lng.toString(),
          "type_absen": type,
          "is_freegeo": isFree,
          "file": await dioo.MultipartFile.fromFile(photoPath, filename: "absensi_photo.jpg"),
          "device_id": "qwertyuiop",
          "id_absen": absenceId,
          "date": formatedateapi.format(DateTime.now()),
        });
        
        return await d.dio.post(
          endpoint,
          data: formData,
          options: dioo.Options(
            contentType: 'multipart/form-data',
            extra: {'withCredential': true},
          ),
        );
      } else {
        // Regular post without photo
        return await d.dio.post(
          endpoint,
          data: {
            "id_employee": LocalDB.user!.activeEmployee.idEmployee,
            "id_user": LocalDB.user!.idUser,
            "lat": lat.toString(),
            "lng": lng.toString(),
            "type_absen": type,
            "is_freegeo": isFree,
            "id_absen": absenceId,
            "device_id": "qwertyuiop",
            "date": formatedateapi.format(DateTime.now()),
          },
          options: dioo.Options(extra: {'withCredential': true}),
        );
      }
    }

    Future<void> handleResponse(dioo.Response response) async {
      final json = response.data is String ? jsonDecode(response.data) : response.data;
      await handleApiResponse<bool>(
        statusCode: response.statusCode!,
        json: json,
        onSuccessMsg: (msg) async {
          result = true;
        },
        onFail: (msg) async {
          msgfail = msg;
          result = false;
        },
        defaultErrorMsg: "Gagal menyimpan data absensi",
      );
    }

    var response = await postData();
    await handleResponse(response);
    return result;
  }

  Future<AbsenStatusModel?> getAbsenStatus() async {
    AbsenStatusModel? result;
    const endpoint = "absensi/get_current_absensi";

    Future<dioo.Response> getData() async {
      return await d.dio.post(
        endpoint,
        data: {
          "id_employee": LocalDB.user!.activeEmployee.idEmployee,
          "device_id": "qwertyuiop",
        },
        options: dioo.Options(extra: {'withCredential': true}),
      );
    }

    Future<void> handleResponseData(dioo.Response response) async {
      final json = response.data is String ? jsonDecode(response.data) : response.data;
      result = AbsenStatusModel.fromJson(json);
    }

    var response = await getData();
    await handleResponseData(response);
    return result;
  }
}