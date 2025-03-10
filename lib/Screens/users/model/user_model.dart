import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 10)
class userModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? userName;
  @HiveField(3)
  String? fullName;
  @HiveField(4)
  String? userMail;
  @HiveField(5)
  String? emailVerifiedAt;
  @HiveField(6)
  String? userPhone;
  @HiveField(7)
  String? userPassword;
  @HiveField(8)
  String? userType;
  @HiveField(9)
  String? status;
  @HiveField(10)
  int? permissions;
  @HiveField(11)
  String? note;
  @HiveField(12)
  String? avatar;
  @HiveField(13)
  String? rememberToken;
  @HiveField(14)
  String? createdAt;
  @HiveField(15)
  String? updatedAt;
  @HiveField(16)
  String? roleTitle;
  @HiveField(17)
  String? roleDescription;
  @HiveField(18)
  String? rolePermissions;
  @HiveField(19)
  int? enterpriseId;

  userModel(
      {this.id,
      this.userName,
      this.fullName,
      this.userMail,
      this.emailVerifiedAt,
      this.userPhone,
      this.userPassword,
      this.userType,
      this.status,
      this.permissions,
      this.note,
      this.avatar,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.roleTitle,
      this.roleDescription,
      this.rolePermissions,
      this.enterpriseId});

  static fromJson(json) {
    return userModel(
      id: json['id'],
      userName: json['user_name'],
      fullName: json['full_name'],
      userMail: json['user_mail'],
      emailVerifiedAt: json['email_verified_at'],
      userPhone: json['user_phone'],
      userPassword: json['user_password'],
      userType: json['user_type'],
      status: json['status'],
      permissions: json['permissions'],
      note: json['note'],
      avatar: json['avatar'],
      rememberToken: json['remember_token'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      roleTitle: json['role_title'],
      roleDescription: json['role_description'],
      rolePermissions: json['role_permissions'],
      enterpriseId: json['enterprise_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = userName;
    data['full_name'] = fullName;
    data['user_mail'] = userMail;
    data['email_verified_at'] = emailVerifiedAt;
    data['user_phone'] = userPhone;
    data['user_password'] = userPassword;
    data['user_type'] = userType;
    data['status'] = status;
    data['permissions'] = permissions;
    data['note'] = note;
    data['avatar'] = avatar;
    data['remember_token'] = rememberToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['role_title'] = roleTitle;
    data['role_description'] = roleDescription;
    data['role_permissions'] = rolePermissions;
    data['enterprise_id'] = enterpriseId;
    return data;
  }
}
