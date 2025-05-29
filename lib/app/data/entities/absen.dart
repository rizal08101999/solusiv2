class AbsensiEntity {
  String id;
  String label;
  String date;
  String timeIn;
  String timeOut;
  String status;

  AbsensiEntity({required this.id, required this.label, required this.date, required this.timeIn, required this.timeOut, required this.status});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'date': date,
      'timeIn': timeIn,
      'timeOut': timeOut,
      'status': status,
    };
  }
}