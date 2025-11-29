class SpEntity {
  final String jenis;
  final String berlaku;
  final String keterangan;

  SpEntity({
    required this.jenis,
    required this.berlaku,
    required this.keterangan,
  });

  factory SpEntity.fromJson(Map<String, dynamic> json) => SpEntity(
    jenis: json["jenis"] ?? '',
    berlaku: json["berlaku"] ?? '',
    keterangan: json["keterangan"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "jenis": jenis,
    "berlaku": berlaku,
    "keterangan": keterangan,
  };
}
