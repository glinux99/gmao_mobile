import '../flight/flight_submit_model.dart';
import 'class_model.dart';
import 'tarification_type_class.dart';

class TarificationResponse {
  int? id;
  String? uuid;
  String? price;
  int? diviceId;
  int? classId;
  int? typeId;
  String? syncStatut;
  String? isActive;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? designation;
  String? numbrOfSeats;
  String? registration;
  String? diviceSeries;
  String? comments;
  int? deviceType;
  int? diviceCategory;
  TarificationTypeResponse? type;
  FlightClassResponse? classData;
  FlightSubmit? divices;

  TarificationResponse(
      {this.id,
      this.uuid,
      this.price,
      this.diviceId,
      this.classId,
      this.typeId,
      this.syncStatut,
      this.isActive,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.designation,
      this.numbrOfSeats,
      this.registration,
      this.diviceSeries,
      this.comments,
      this.deviceType,
      this.diviceCategory,
      this.type,
      this.classData,
      this.divices});

  TarificationResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    price = json['price'];
    diviceId = json['diviceId'];
    classId = json['classId'];
    typeId = json['typeId'];
    syncStatut = json['syncStatut'];
    isActive = json['isActive'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    designation = json['designation'];
    numbrOfSeats = json['numbrOfSeats'];
    registration = json['registration'];
    diviceSeries = json['diviceSeries'];
    comments = json['comments'];
    deviceType = json['deviceType'];
    diviceCategory = json['diviceCategory'];
    type = json['type'] != null
        ? TarificationTypeResponse.fromJson(json['type'])
        : null;
    classData = json['class'] != null
        ? FlightClassResponse.fromJson(json['class'])
        : null;
    divices =
        json['divices'] != null ? FlightSubmit.fromJson(json['divices']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['price'] = price;
    data['diviceId'] = diviceId;
    data['classId'] = classId;
    data['typeId'] = typeId;
    data['syncStatut'] = syncStatut;
    data['isActive'] = isActive;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['designation'] = designation;
    data['numbrOfSeats'] = numbrOfSeats;
    data['registration'] = registration;
    data['diviceSeries'] = diviceSeries;
    data['comments'] = comments;
    data['deviceType'] = deviceType;
    data['diviceCategory'] = diviceCategory;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    if (classData != null) {
      data['class'] = classData!.toJson();
    }
    if (divices != null) {
      data['divices'] = divices!.toJson();
    }
    return data;
  }
}
