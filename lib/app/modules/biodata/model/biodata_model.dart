class PersonalDataEntity {
  final String title;
  final dynamic data;

  PersonalDataEntity({
    required this.title,
    required this.data,
  });

  factory PersonalDataEntity.fromJson(Map<String, dynamic> json) => PersonalDataEntity(
    title: json["title"] ?? '',
    data: json["data"],
  );
}