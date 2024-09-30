import 'package:flutter_clean_architecture/data/dto/base_dto.dart';
import 'package:flutter_clean_architecture/domain/entities/refresh_token_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_request_dto.g.dart';

@JsonSerializable(
  createToJson: true,
  explicitToJson: true,
)
class RefreshTokenRequestDTO extends BaseDTO<RefreshTokenRequestEntity> {
  final String refreshToken;
  final int? expiresInMins;

  const RefreshTokenRequestDTO({
    required this.refreshToken,
    this.expiresInMins,
  });

  @override
  RefreshTokenRequestEntity toEntity() => RefreshTokenRequestEntity(
        refreshToken: refreshToken,
        expiresInMins: expiresInMins,
      );

  @override
  List<Object?> get props => [refreshToken, expiresInMins];

  Map<String, dynamic> toJson() => _$RefreshTokenRequestDTOToJson(this);
}
