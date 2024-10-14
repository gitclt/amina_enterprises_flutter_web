// To parse this JSON data, do
//
//     final dashboardCountModel = dashboardCountModelFromJson(jsonString);

import 'dart:convert';

DashboardCountModel dashboardCountModelFromJson(String str) => DashboardCountModel.fromJson(json.decode(str));

String dashboardCountModelToJson(DashboardCountModel data) => json.encode(data.toJson());

class DashboardCountModel {
    bool? status;
    List<DashCountData>? data;

    DashboardCountModel({
        this.status,
        this.data,
    });

    factory DashboardCountModel.fromJson(Map<String, dynamic> json) => DashboardCountModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<DashCountData>.from(json["data"]!.map((x) => DashCountData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class DashCountData {
    String? name;
    int? count;

    DashCountData({
        this.name,
        this.count,
    });

    factory DashCountData.fromJson(Map<String, dynamic> json) => DashCountData(
        name: json["name"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "count": count,
    };
}
