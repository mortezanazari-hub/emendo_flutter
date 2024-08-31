import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String username;
  final String email;
  @JsonKey(nullable: true)
  final String? mobile;
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson, nullable: true)
  final DateTime? emailVerifiedAt;
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  final DateTime createdAt;
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.mobile,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  static DateTime? _dateTimeFromJson(dynamic json) {
    if (json == null) return null;
    return DateTime.parse(json as String);
  }

  static String? _dateTimeToJson(DateTime? date) {
    return date?.toIso8601String();
  }
}