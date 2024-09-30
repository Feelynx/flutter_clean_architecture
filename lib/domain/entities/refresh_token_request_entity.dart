import 'package:flutter_clean_architecture/data/dto/refresh_token_request_dto.dart';
import 'package:flutter_clean_architecture/domain/entities/base_entity.dart';

class RefreshTokenRequestEntity extends BaseEntity<RefreshTokenRequestDTO> {
  final String refreshToken;
  final int? expiresInMins;

  const RefreshTokenRequestEntity({
    required this.refreshToken,
    this.expiresInMins,
  });

  @override
  List<Object?> get props => [refreshToken, expiresInMins];

  @override
  RefreshTokenRequestDTO toDTO() {
    return RefreshTokenRequestDTO(
      refreshToken: refreshToken,
      expiresInMins: expiresInMins,
    );
  }
}
