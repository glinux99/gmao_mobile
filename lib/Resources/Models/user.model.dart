// import '../../Resources/Helpers/uuid_generator.dart';

class UserModel {
  final dynamic fullname, phone, username, password, level;
  final String? email, address, uuid;
  int? syncStatus, isActive, id;
  List permissions;

  UserModel(
      {required this.fullname,
      required this.phone,
      required this.username,
      required this.password,
      required this.level,
      this.email,
      this.address,
      this.isActive,
      this.syncStatus,
      this.uuid,
      this.id,
      this.permissions = const []});

  static fromJSON(json) {
    return UserModel(
      fullname: json['fullname'],
      phone: json['phone'],
      username: json['username'],
      password: json['password'],
      level: json['level'] ?? '',
      email: json['email'],
      address: json['address'],
      isActive: int.tryParse(json['isActive'].toString()) ?? 1,
      syncStatus: int.tryParse(json['syncStatus'].toString()) ?? 0,
      // uuid: json['uuid'] ?? uuidGenerator(),
      id: int.tryParse(json['id'].toString()) ?? 0,
      permissions: json['roles'] ?? [],
    );
  }

  toJSON() {
    return {
      "fullname": fullname,
      "phone": phone,
      "username": username,
      "password": password,
      "level": level,
      "email": email,
      "address": address,
      "isActive": isActive,
      "syncStatus": syncStatus,
      "uuid": uuid,
      "id": id,
      "roles": permissions
    };
  }
}

class AuthModel {
  final UserModel user;
  final String token;
  AuthModel({required this.user, required this.token});

  static fromJSON(json) {
    return AuthModel(
        user: UserModel.fromJSON(json['user']), token: json['token']);
  }

  toJSON() {
    return {"user": user.toJSON(), 'token': token};
  }
}
