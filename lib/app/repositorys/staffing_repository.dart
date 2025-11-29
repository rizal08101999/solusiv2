import 'dart:convert';
import 'package:dio/dio.dart' as dioo;
import 'package:solusi/app/modules/biodata/model/biodata_model.dart';
import 'package:solusi/app/modules/pkwt/model/pkwt_model.dart';
import 'package:solusi/app/modules/sp/model/sp_model.dart';
import 'package:solusi/core/helper.dart';
import 'package:solusi/core/local_db.dart';

class StaffingRepository {
  final d = DioClient();

  Future<List<PersonalDataEntity>> getPersonalData() async {
    List<PersonalDataEntity> result = [];
    const endpoint = "employee/get_data";

    Future<dioo.Response> getData() async {
      return await d.dio.post(
        endpoint,
        data: {
          "id_employee": LocalDB.user!.activeEmployee.idEmployee,
          "type": "0",
          "device_id": "qwertyuiop",
        },
        options: dioo.Options(
          extra: {'withCredential': true},
        ),
      );
    }

    Future<void> handleResponse(dioo.Response response) async {
      final json = response.data is String ? jsonDecode(response.data) : response.data;
      await handleApiResponse<List<PersonalDataEntity>>(
        statusCode: response.statusCode,
        json: json,
        fromJson: (data) async {
          return (data as List).map((e) => PersonalDataEntity.fromJson(e as Map<String, dynamic>)).toList();
        },
        onSuccess: (data) async {
          result = data;
        },
        onFail: (msg) async {
          result = [];
        },
        defaultErrorMsg: "Gagal mendapatkan data pribadi",
      );
    }

    var response = await getData();
    await handleResponse(response);
    return result;
  }

  Future<List<PersonalDataEntity>> getEducationData() async {
    List<PersonalDataEntity> result = [];
    const endpoint = "employee/get_data";

    Future<dioo.Response> getData() async {
      return await d.dio.post(
        endpoint,
        data: {
          "id_employee": LocalDB.user!.activeEmployee.idEmployee,
          "type": "1",
          "device_id": "qwertyuiop",
        },
        options: dioo.Options(extra: {'withCredential': true}),
      );
    }

    Future<void> handleResponse(dioo.Response response) async {
      final json = response.data is String ? jsonDecode(response.data) : response.data;
      await handleApiResponse<List<PersonalDataEntity>>(
        statusCode: response.statusCode,
        json: json,
        fromJson: (data) async => (data as List).map((e) => PersonalDataEntity.fromJson(e)).toList(),
        onSuccess: (data) async => result = data,
        onFail: (msg) async => result = [],
        defaultErrorMsg: "Gagal mendapatkan data pendidikan",
      );
    }

    var response = await getData();
    await handleResponse(response);
    return result;
  }

  Future<List<PersonalDataEntity>> getStaffingData() async {
    List<PersonalDataEntity> result = [];
    const endpoint = "employee/get_data";

    Future<dioo.Response> getData() async {
      return await d.dio.post(
        endpoint,
        data: {
          "id_employee": LocalDB.user!.activeEmployee.idEmployee,
          "type": "2",
          "device_id": "qwertyuiop",
        },
        options: dioo.Options(extra: {'withCredential': true}),
      );
    }

    Future<void> handleResponse(dioo.Response response) async {
      final json = response.data is String ? jsonDecode(response.data) : response.data;
      await handleApiResponse<List<PersonalDataEntity>>(
        statusCode: response.statusCode,
        json: json,
        fromJson: (data) async => (data as List).map((e) => PersonalDataEntity.fromJson(e)).toList(),
        onSuccess: (data) async => result = data,
        onFail: (msg) async => result = [],
        defaultErrorMsg: "Gagal mendapatkan data kepegawaian",
      );
    }

    var response = await getData();
    await handleResponse(response);
    return result;
  }

  Future<List<PersonalDataEntity>> getFamilyData() async {
    List<PersonalDataEntity> result = [];
    const endpoint = "employee/get_data";

    Future<dioo.Response> getData() async {
      return await d.dio.post(
        endpoint,
        data: {
          "id_employee": LocalDB.user!.activeEmployee.idEmployee,
          "type": "3",
          "device_id": "qwertyuiop",
        },
        options: dioo.Options(extra: {'withCredential': true}),
      );
    }

    Future<void> handleResponse(dioo.Response response) async {
      final json = response.data is String ? jsonDecode(response.data) : response.data;
      await handleApiResponse<List<PersonalDataEntity>>(
        statusCode: response.statusCode,
        json: json,
        fromJson: (data) async => (data as List).map((e) => PersonalDataEntity.fromJson(e)).toList(),
        onSuccess: (data) async => result = data,
        onFail: (msg) async => result = [],
        defaultErrorMsg: "Gagal mendapatkan data orang tua",
      );
    }

    var response = await getData();
    await handleResponse(response);
    return result;
  }

  Future<List<PersonalDataEntity>> getInsuranceData() async {
    List<PersonalDataEntity> result = [];
    const endpoint = "employee/get_data";

    Future<dioo.Response> getData() async {
      return await d.dio.post(
        endpoint,
        data: {
          "id_employee": LocalDB.user!.activeEmployee.idEmployee,
          "type": "4",
          "device_id": "qwertyuiop",
        },
        options: dioo.Options(extra: {'withCredential': true}),
      );
    }

    Future<void> handleResponse(dioo.Response response) async {
      final json = response.data is String ? jsonDecode(response.data) : response.data;
      await handleApiResponse<List<PersonalDataEntity>>(
        statusCode: response.statusCode,
        json: json,
        fromJson: (data) async => (data as List).map((e) => PersonalDataEntity.fromJson(e)).toList(),
        onSuccess: (data) async => result = data,
        onFail: (msg) async => result = [],
        defaultErrorMsg: "Gagal mendapatkan data asuransi",
      );
    }

    var response = await getData();
    await handleResponse(response);
    return result;
  }

  Future<List<PersonalDataEntity>> getBankData() async {
    List<PersonalDataEntity> result = [];
    const endpoint = "employee/get_data";

    Future<dioo.Response> getData() async {
      return await d.dio.post(
        endpoint,
        data: {
          "id_employee": LocalDB.user!.activeEmployee.idEmployee,
          "type": "5",
          "device_id": "qwertyuiop",
        },
        options: dioo.Options(extra: {'withCredential': true}),
      );
    }

    Future<void> handleResponse(dioo.Response response) async {
      final json = response.data is String ? jsonDecode(response.data) : response.data;
      await handleApiResponse<List<PersonalDataEntity>>(
        statusCode: response.statusCode,
        json: json,
        fromJson: (data) async => (data as List).map((e) => PersonalDataEntity.fromJson(e)).toList(),
        onSuccess: (data) async => result = data,
        onFail: (msg) async => result = [],
        defaultErrorMsg: "Gagal mendapatkan data bank",
      );
    }

    var response = await getData();
    await handleResponse(response);
    return result;
  }

  Future<List<PkwtModel>> getPkwt() async {
    List<PkwtModel> result = [];
    const endpoint = "employee/get_pkwt";

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
      await handleApiResponse<List<PkwtModel>>(
        statusCode: response.statusCode,
        json: json,
        fromJson: (data) async => (data as List).map((e) => PkwtModel.fromJson(e)).toList(),
        onSuccess: (data) async => result = data,
        onFail: (msg) async => result = [],
        defaultErrorMsg: "Gagal mendapatkan data pkwt",
      );
    }

    var response = await getData();
    await handleResponse(response);
    return result;
  }

  Future<List<SpEntity>> getSp() async {
    List<SpEntity> result = [];
    const endpoint = "employee/get_sp";

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
      await handleApiResponse<List<SpEntity>>(
        statusCode: response.statusCode,
        json: json,
        fromJson: (data) async => (data as List).map((e) => SpEntity.fromJson(e)).toList(),
        onSuccess: (data) async => result = data,
        onFail: (msg) async => result = [],
        defaultErrorMsg: "Gagal mendapatkan data pkwt",
      );
    }

    var response = await getData();
    await handleResponse(response);
    return result;
  }

  
}