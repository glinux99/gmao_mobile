// class CreateFlightResponse {
//   String? uuid;
//   String? designation;
//   int? numberOfTracks;
//   bool? syncStatut;
//   dynamic isActive;
//   int? userId;
//   String? updatedAt;
//   String? createdAt;
//   int? id;

//   CreateFlightResponse(
//       {this.uuid,
//       this.designation,
//       this.numberOfTracks,
//       this.syncStatut,
//       this.isActive,
//       this.userId,
//       this.updatedAt,
//       this.createdAt,
//       this.id});

//   CreateFlightResponse.fromJson(Map<String, dynamic> json) {
//     uuid = json['uuid'];
//     designation = json['designation'];
//     numberOfTracks = json['numberOfTracks'];
//     syncStatut = json['syncStatut'];
//     isActive = json['isActive'];
//     userId = json['user_id'];
//     updatedAt = json['updated_at'];
//     createdAt = json['created_at'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['uuid'] = uuid;
//     data['designation'] = designation;
//     data['numberOfTracks'] = numberOfTracks;
//     data['syncStatut'] = syncStatut;
//     data['isActive'] = isActive;
//     data['user_id'] = userId;
//     data['updated_at'] = updatedAt;
//     data['created_at'] = createdAt;
//     data['id'] = id;
//     return data;
//   }
// }
