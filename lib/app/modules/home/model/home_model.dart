class DashboardEntity {
    String id;
    String codeIcon;
    String fontFamily;
    String fontPackage;
    String label;
    String value;
    String desc;

    DashboardEntity({
        required this.id,
        required this.codeIcon,
        required this.fontFamily,
        required this.fontPackage,
        required this.label,
        required this.value,
        required this.desc,
    });

    factory DashboardEntity.fromJson(Map<String, dynamic> json) => DashboardEntity(
        id: json["id"],
        codeIcon: json["code_icon"],
        fontFamily: json["font_family"],
        fontPackage: json["font_package"],
        label: json["label"],
        value: json["value"],
        desc: json["desc"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code_icon": codeIcon,
        "font_family": fontFamily,
        "font_package": fontPackage,
        "label": label,
        "value": value,
        "desc": desc,
    };

    @override
    String toString() {
      return 'DashboardEntity(label: $label, value: $value, desc: $desc)';
    }
}