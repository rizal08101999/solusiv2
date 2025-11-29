class ScheduleEntity {
  final String title;
  final String data;

  ScheduleEntity({
    required this.title,
    required this.data,
  });

  factory ScheduleEntity.fromJson(Map<String, dynamic> json) => ScheduleEntity(
    title: json["title"] ?? '',
    data: json["data"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "data": data,
  };
}
