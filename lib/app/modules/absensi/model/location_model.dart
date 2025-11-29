class LocationModel {
  String id;
  String name;
  String lat;
  String lng;
  String distance;

  LocationModel({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
    required this.distance,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    id: json["id"],
    name: json["name"],
    lat: json["lat"],
    lng: json["lng"],
    distance: json["distance"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lat": lat,
    "lng": lng,
    "distance": distance,
  };

  double get latitude => double.parse(lat);
  double get longitude => double.parse(lng);
  double get radiusInMeters => double.parse(distance);
}