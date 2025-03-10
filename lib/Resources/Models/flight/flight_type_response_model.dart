class FlightTypeResponse {
  int? id;
  String? uuid;
  String? designation;
  String? description;
  String? syncStatut;
  String? isActive;
  int? userId;
  String? createdAt;
  String? updatedAt;

  FlightTypeResponse(
      {this.id,
      this.uuid,
      this.designation,
      this.description,
      this.syncStatut,
      this.isActive,
      this.userId,
      this.createdAt,
      this.updatedAt});

  FlightTypeResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    designation = json['designation'];
    description = json['description'];
    syncStatut = json['syncStatut'];
    isActive = json['isActive'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['designation'] = designation;
    data['description'] = description;
    data['syncStatut'] = syncStatut;
    data['isActive'] = isActive;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
