// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'dart:convert';

EmployeeModel employeeModelFromJson(String str) =>
    EmployeeModel.fromJson(json.decode(str));

String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

class EmployeeModel {
  bool? status;
  String? message;
  int? totalCount;
  int? totalPages;
  List<EmployeeData>? data;

  EmployeeModel({
    this.status,
    this.message,
    this.totalCount,
    this.totalPages,
    this.data,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        status: json["status"],
        message: json["message"],
        totalCount: json["totalCount"],
        totalPages: json["totalPages"],
        data: json["data"] == null
            ? []
            : List<EmployeeData>.from(
                json["data"]!.map((x) => EmployeeData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "totalCount": totalCount,
        "totalPages": totalPages,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class EmployeeData {
  int? id;
  String? name;
  String? mobile;
  String? password;
  String? email;
  String? location;
  int? roleId;
  String? role;
  int? activeStatus;
  String? joiningDate;
  int? districtId;
  String? address;
  String? code;
  int? stateId;
  String? state;
  String? district;
  int? designationId;
  String? designation;
  String? routeAssigned;
  List<EmpDivision>? divisions;
  List<Route>? route;

  EmployeeData({
    this.id,
    this.name,
    this.mobile,
    this.password,
    this.email,
    this.location,
    this.roleId,
    this.role,
    this.activeStatus,
    this.joiningDate,
    this.districtId,
    this.address,
    this.code,
    this.stateId,
    this.state,
    this.district,
    this.designationId,
    this.designation,
    this.routeAssigned,
    this.divisions,
    this.route,
  });

  factory EmployeeData.fromJson(Map<String, dynamic> json) => EmployeeData(
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        password: json["password"],
        email: json["email"],
        location: json["location"],
        roleId: json["role_id"],
        role: json["role"],
        activeStatus: json["active_status"],
        joiningDate: json["joining_date"],
        districtId: json["district_id"],
        address: json["address"],
        code: json["code"],
        stateId: json["state_id"],
        state: json["state"],
        district: json["district"],
        designationId: json["designation_id"],
        designation: json["designation"],
        routeAssigned: json["routeAssigned"],
        divisions: json["divisions"] == null
            ? []
            : List<EmpDivision>.from(
                json["divisions"]!.map((x) => EmpDivision.fromJson(x))),
        route: json["route"] == null
            ? []
            : List<Route>.from(json["route"]!.map((x) => Route.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "password": password,
        "email": email,
        "location": location,
        "role_id": roleId,
        "role": role,
        "active_status": activeStatus,
        "joining_date": joiningDate,
        "district_id": districtId,
        "address": address,
        "code": code,
        "state_id": stateId,
        "state": state,
        "district": district,
        "designation_id": designationId,
        "designation": designation,
        "routeAssigned": routeAssigned,
        "divisions": divisions == null
            ? []
            : List<dynamic>.from(divisions!.map((x) => x.toJson())),
        "route": route == null
            ? []
            : List<dynamic>.from(route!.map((x) => x.toJson())),
      };
}

class EmpDivision {
  int? empId;
  int? divisionId;
  String? divisionName;

  EmpDivision({
    this.empId,
    this.divisionId,
    this.divisionName,
  });

  factory EmpDivision.fromJson(Map<String, dynamic> json) => EmpDivision(
        empId: json["emp_id"],
        divisionId: json["division_id"],
        divisionName: json["division_name"],
      );

  Map<String, dynamic> toJson() => {
        "emp_id": empId,
        "division_id": divisionId,
        "division_name": divisionName,
      };
}

class Route {
  int? empId;
  int? monRouteId;
  String? monRouteName;
  int? tueRouteId;
  String? tueRouteName;
  int? wedRouteId;
  String? wedRouteName;
  int? thuRouteId;
  String? thuRouteName;
  int? friRouteId;
  String? friRouteName;
  int? satRouteId;
  int? routeId;
  String? satRouteName;

  Route(
      {this.empId,
      this.monRouteId,
      this.monRouteName,
      this.tueRouteId,
      this.tueRouteName,
      this.wedRouteId,
      this.wedRouteName,
      this.thuRouteId,
      this.thuRouteName,
      this.friRouteId,
      this.friRouteName,
      this.satRouteId,
      this.satRouteName,
      this.routeId});

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        empId: json["emp_id"],
        monRouteId: json["mon_route_id"],
        monRouteName: json["mon_route_name"],
        tueRouteId: json["tue_route_id"],
        tueRouteName: json["tue_route_name"],
        wedRouteId: json["wed_route_id"],
        wedRouteName: json["wed_route_name"],
        thuRouteId: json["thu_route_id"],
        thuRouteName: json["thu_route_name"],
        friRouteId: json["fri_route_id"],
        friRouteName: json["fri_route_name"],
        satRouteId: json["sat_route_id"],
        satRouteName: json["sat_route_name"],
        routeId: json["route_id"],
      );

  Map<String, dynamic> toJson() => {
        "emp_id": empId,
        "mon_route_id": monRouteId,
        "mon_route_name": monRouteName,
        "tue_route_id": tueRouteId,
        "tue_route_name": tueRouteName,
        "wed_route_id": wedRouteId,
        "wed_route_name": wedRouteName,
        "thu_route_id": thuRouteId,
        "thu_route_name": thuRouteName,
        "fri_route_id": friRouteId,
        "fri_route_name": friRouteName,
        "sat_route_id": satRouteId,
        "sat_route_name": satRouteName,
        "route_id": routeId,
      };
}
