import 'flight_category_response_model.dart';
import 'flight_type_response_model.dart';

class FlightSubmit {
  String? deviceTypeName;
  String? diviceCategoryName;
  int? id;
  String? uuid;
  String? designation;
  String? numbrOfSeats;
  String? registration;
  String? diviceSeries;
  String? comments;
  String? syncStatut;
  String? handbag;
  String? checkedBaggage;
  String? isActive;
  int? deviceType;
  int? diviceCategory;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? numbrMaxOfSeatsChild;
  FlightTypeResponse? type;
  FlightCategoryResponse? category;

  FlightSubmit(
      {this.deviceTypeName,
      this.diviceCategoryName,
      this.id,
      this.numbrMaxOfSeatsChild,
      this.uuid,
      this.designation,
      this.numbrOfSeats,
      this.registration,
      this.handbag,
      this.checkedBaggage,
      this.diviceSeries,
      this.comments,
      this.syncStatut,
      this.isActive,
      this.deviceType,
      this.diviceCategory,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.type,
      this.category});

  FlightSubmit.fromJson(Map<String, dynamic> json) {
    deviceTypeName = json['deviceTypeName'];
    numbrMaxOfSeatsChild = json['numbrMaxOfSeatsChild'];
    diviceCategoryName = json['diviceCategoryName'];
    id = json['id'];
    uuid = json['uuid'];
    designation = json['designation'];
    numbrOfSeats = json['numbrOfSeats'];
    registration = json['registration'];
    diviceSeries = json['diviceSeries'];
     handbag = json['handbag'];
    checkedBaggage = json['checkedBaggage'];
    comments = json['comments'];
    syncStatut = json['syncStatut'];
    isActive = json['isActive'];
    deviceType = json['deviceType'];
    diviceCategory = json['diviceCategory'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'] != null ? FlightTypeResponse.fromJson(json['type']) : null;
    category =
        json['category'] != null ? FlightCategoryResponse.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deviceTypeName'] = deviceTypeName;
    data['numbrMaxOfSeatsChild'] = numbrMaxOfSeatsChild;
    data['diviceCategoryName'] = diviceCategoryName;
    data['id'] = id;
    data['uuid'] = uuid;
    data['designation'] = designation;
    data['numbrOfSeats'] = numbrOfSeats;
    data['registration'] = registration;
    data['diviceSeries'] = diviceSeries;
     data['handbag'] = handbag;
    data['checkedBaggage'] = checkedBaggage;
    data['comments'] = comments;
    data['syncStatut'] = syncStatut;
    data['isActive'] = isActive;
    data['deviceType'] = deviceType;
    data['diviceCategory'] = diviceCategory;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}
