import 'package:flutter_clean_architecture/data/dto/login_response_dto.dart';
import 'package:flutter_clean_architecture/domain/entities/base_entity.dart';

class LoginResponseEntity extends BaseEntity {
  final String? accessToken;
  final String? refreshToken;
  final int? id;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;

  const LoginResponseEntity({
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
  AuthResponseDTO toDTO() => AuthResponseDTO(
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

  @override
  List<Object?> get props => [accessToken, refreshToken, id, username, email, firstName, lastName];

  LoginResponseEntity copyWith({
    String? accessToken,
    String? refreshToken,
    int? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? gender,
    String? image,
  }) {
    return LoginResponseEntity(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      image: image ?? this.image,
    );
  }
}
