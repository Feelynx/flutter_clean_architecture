import 'package:flutter_clean_architecture/data/dto/base_dto.dart';
import 'package:flutter_clean_architecture/domain/entities/refresh_token_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_response_dto.g.dart';

@JsonSerializable(
  createToJson: true,
  explicitToJson: true,
)
class RefreshTokenResponseDTO extends BaseDTO<RefreshTokenResponseEntity> {
  final String? accessToken;
  final String? refreshToken;

  const RefreshTokenResponseDTO({
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  RefreshTokenResponseEntity toEntity() => RefreshTokenResponseEntity(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );

  @override
  List<Object?> get props => [accessToken, refreshToken];

  factory RefreshTokenResponseDTO.fromJson(Map<String, dynamic> json) => _$RefreshTokenResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenResponseDTOToJson(this);
}
