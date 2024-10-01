import 'package:flutter_clean_architecture/data/dto/base_dto.dart';
import 'package:flutter_clean_architecture/domain/entities/refresh_user_session_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refresh_user_session_response_dto.g.dart';

@JsonSerializable(
  createToJson: true,
  explicitToJson: true,
)
class RefreshUserSessionResponseDTO extends BaseDTO<RefreshUserSessionResponseEntity> {
  final String? accessToken;
  final String? refreshToken;

  const RefreshUserSessionResponseDTO({
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  RefreshUserSessionResponseEntity toEntity() => RefreshUserSessionResponseEntity(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );

  @override
  List<Object?> get props => [accessToken, refreshToken];

  factory RefreshUserSessionResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$RefreshUserSessionResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshUserSessionResponseDTOToJson(this);
}
