class EmpAddModel {
  Employee? employee;
  List<Division>? divisions;

  EmpAddModel({
    this.employee,
    this.divisions,
  });

  factory EmpAddModel.fromJson(Map<String, dynamic> json) => EmpAddModel(
        employee: json["employee"] == null
            ? null
            : Employee.fromJson(json["employee"]),
        divisions: json["divisions"] == null
            ? []
            : List<Division>.from(
                json["divisions"]!.map((x) => Division.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "employee": employee?.toJson(),
        "divisions": divisions == null
            ? []
            : List<dynamic>.from(divisions!.map((x) => x.toJson())),
      };
}

class Division {
  String? divisionId;

  Division({
    this.divisionId,
  });

  factory Division.fromJson(Map<String, dynamic> json) => Division(
        divisionId: json["division_id"],
      );

  Map<String, dynamic> toJson() => {
        "division_id": divisionId,
      };
}

class Employee {
  String? id;
  String? code;
  String? name;
  String? email;
  String? mobile;
  String? password;
  String? address;
  String? stateId;
  String? location;
  String? roleId;
  String? activeStatus;
  String? addedby;
  String? designationId;
  DateTime? joiningDate;
  String? districtId;

  Employee({
    this.id,
    this.code,
    this.name,
    this.email,
    this.mobile,
    this.password,
    this.address,
    this.stateId,
    this.location,
    this.roleId,
    this.activeStatus,
    this.addedby,
    this.designationId,
    this.joiningDate,
    this.districtId,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
        address: json["address"],
        stateId: json["state_id"],
        location: json["location"],
        roleId: json["role_id"],
        activeStatus: json["active_status"],
        addedby: json["addedby"],
        designationId: json["designation_id"],
        joiningDate: json["joining_date"] == null
            ? null
            : DateTime.parse(json["joining_date"]),
        districtId: json["district_id"],
      );

  Map<String, dynamic> toJson() => {
        if (id != null) "id": id,
        "code": code,
        "name": name,
        "email": email,
        "mobile": mobile,
        "password": password,
        "address": address,
        "state_id": stateId,
        "location": location,
        "role_id": roleId,
        "active_status": activeStatus,
        "addedby": addedby,
        "designation_id": designationId,
        "joining_date":
            "${joiningDate!.year.toString().padLeft(4, '0')}-${joiningDate!.month.toString().padLeft(2, '0')}-${joiningDate!.day.toString().padLeft(2, '0')}",
        "district_id": districtId,
      };
}
