class UserEntity {
    String token;
    String idUser;
    List<ArrayEmployee> arrayEmployee;
    ArrayEmployee arrayActiveEmployee;
    String name;
    String iddevisi;
    String divisi;
    dynamic image;
    String username;
    String phone;

    UserEntity({
        required this.token,
        required this.idUser,
        required this.arrayEmployee,
        required this.arrayActiveEmployee,
        required this.name,
        required this.iddevisi,
        required this.divisi,
        required this.image,
        required this.username,
        required this.phone,
    });

    factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        token: json["token"],
        idUser: json["id_user"],
        arrayEmployee: List<ArrayEmployee>.from(json["array_employee"].map((x) => ArrayEmployee.fromJson(x))),
        arrayActiveEmployee: ArrayEmployee.fromJson(json["array_active_employee"]),
        name: json["name"],
        iddevisi: json["iddevisi"],
        divisi: json["divisi"],
        image: json["image"],
        username: json["username"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "id_user": idUser,
        "array_employee": List<dynamic>.from(arrayEmployee.map((x) => x.toJson())),
        "array_active_employee": arrayActiveEmployee.toJson(),
        "name": name,
        "iddevisi": iddevisi,
        "divisi": divisi,
        "image": image,
        "username": username,
        "phone": phone,
    };
}

class ArrayEmployee {
    String idEmployee;
    String numberEmployee;
    String nameEmployee;
    String idCompany;
    String nameCompany;
    String imageCompany;

    ArrayEmployee({
        required this.idEmployee,
        required this.numberEmployee,
        required this.nameEmployee,
        required this.idCompany,
        required this.nameCompany,
        required this.imageCompany,
    });

    factory ArrayEmployee.fromJson(Map<String, dynamic> json) => ArrayEmployee(
        idEmployee: json["id_employee"],
        numberEmployee: json["number_employee"],
        nameEmployee: json["name_employee"],
        idCompany: json["id_company"],
        nameCompany: json["name_company"],
        imageCompany: json["image_company"],
    );

    Map<String, dynamic> toJson() => {
        "id_employee": idEmployee,
        "number_employee": numberEmployee,
        "name_employee": nameEmployee,
        "id_company": idCompany,
        "name_company": nameCompany,
        "image_company": imageCompany,
    };
}