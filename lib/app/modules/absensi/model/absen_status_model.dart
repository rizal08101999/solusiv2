class AbsenStatusModel {
  final bool error;
  final String idAbsen;
  final bool isIn;
  final List<dynamic> data;
  final String errorMsg;

  AbsenStatusModel({
    required this.error,
    required this.idAbsen,
    required this.isIn,
    required this.data,
    required this.errorMsg,
  });

  factory AbsenStatusModel.fromJson(Map<String, dynamic> json) {
    return AbsenStatusModel(
      error: json['error'] ?? false,
      idAbsen: json['id_absen']?.toString() ?? '0',
      isIn: json['is_in'] ?? false,
      data: json['data'] ?? [],
      errorMsg: json['error_msg']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'id_absen': idAbsen,
      'is_in': isIn,
      'data': data,
      'error_msg': errorMsg,
    };
  }
}