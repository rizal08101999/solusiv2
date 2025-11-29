class PkwtModel {
  final String title;
  final dynamic data;

  PkwtModel({
    required this.title,
    required this.data,
  });

  factory PkwtModel.fromJson(Map<String, dynamic> json) => PkwtModel(
    title: json["title"] ?? '',
    data: json["data"],
  );
}
