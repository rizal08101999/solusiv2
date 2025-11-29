import '../../../modules/absensi/model/absensi_model.dart';

class HistoryModel {
  String date;
  String type;
  String absensiName;
  String manual;
  List<AbsensiModel> dataAbsensi;

  HistoryModel({
    required this.date,
    required this.type,
    required this.absensiName,
    required this.manual,
    required this.dataAbsensi,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
    date: json["date"],
    type: json["type"],
    absensiName: json["absensi_name"],
    manual: json["manual"],
    dataAbsensi: (json["data_absensi"] as List)
        .map((item) => AbsensiModel.fromJson(item))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "type": type,
    "absensi_name": absensiName,
    "manual": manual,
    "data_absensi": dataAbsensi.map((item) => item.toJson()).toList(),
  };
}