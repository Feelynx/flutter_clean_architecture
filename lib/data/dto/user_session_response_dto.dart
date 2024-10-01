import 'package:flutter_clean_architecture/data/dto/base_dto.dart';
import 'package:flutter_clean_architecture/domain/entities/user_session_response_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_session_response_dto.g.dart';

@JsonSerializable()
class UserSessionResponseDTO extends BaseDTO<UserSessionResponseEntity> {
  final String? accessToken;
  final String? refreshToken;
  final int? id;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;

  const UserSessionResponseDTO({
    this.accessToken,
    this.refreshToken,
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
  });

  @override
  UserSessionResponseEntity toEntity() {
    return UserSessionResponseEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
      id: id,
      username: username,
      email: email,
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      image: image,
    );
  }

  @override
  List<Object?> get props => [accessToken, refreshToken, id, username, email, firstName, lastName];

  factory UserSessionResponseDTO.fromJson(Map<String, dynamic> json) => _$UserSessionResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserSessionResponseDTOToJson(this);
}
