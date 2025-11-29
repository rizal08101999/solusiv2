class AbsensiModel {
    String labelType;
    String time;
    String? textLateIn;
    String datetimeSchedule;
    String date;
    String? lateIn;
    String lat;
    String lng;
    String image;
    String? textLateOut;
    String? lateOut;

    AbsensiModel({
        required this.labelType,
        required this.time,
        this.textLateIn,
        required this.datetimeSchedule,
        required this.date,
        this.lateIn,
        required this.lat,
        required this.lng,
        required this.image,
        this.textLateOut,
        this.lateOut,
    });

    factory AbsensiModel.fromJson(Map<String, dynamic> json) => AbsensiModel(
        labelType: json["label_type"],
        time: json["time"],
        textLateIn: json["text_late_in"],
        datetimeSchedule: json["datetime_schedule"],
        date: json["date"],
        lateIn: json["late_in"],
        lat: json["lat"],
        lng: json["lng"],
        image: json["image"],
        textLateOut: json["text_late_out"],
        lateOut: json["late_out"],
    );

    Map<String, dynamic> toJson() => {
        "label_type": labelType,
        "time": time,
        "text_late_in": textLateIn,
        "datetime_schedule": datetimeSchedule,
        "date": date,
        "late_in": lateIn,
        "lat": lat,
        "lng": lng,
        "image": image,
        "text_late_out": textLateOut,
        "late_out": lateOut,
    };
}

class LocationEntity {
    String freeGeo;
    String labelFreeGeo;
    bool error;
    List<DataLocation> data;

    LocationEntity({
        required this.freeGeo,
        required this.labelFreeGeo,
        required this.error,
        required this.data,
    });

    factory LocationEntity.fromJson(Map<String, dynamic> json) => LocationEntity(
        freeGeo: json["free_geo"],
        labelFreeGeo: json["label_free_geo"],
        error: json["error"],
        data: List<DataLocation>.from(json["data"].map((x) => DataLocation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "free_geo": freeGeo,
        "label_free_geo": labelFreeGeo,
        "error": error,
        "data": List<DataLocation>.from(data.map((x) => x.toJson())),
    };
}

class DataLocation {
    String id;
    String name;
    String lat;
    String lng;
    String distance;

    DataLocation({
        required this.id,
        required this.name,
        required this.lat,
        required this.lng,
        required this.distance,
    });

    factory DataLocation.fromJson(Map<String, dynamic> json) => DataLocation(
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
}