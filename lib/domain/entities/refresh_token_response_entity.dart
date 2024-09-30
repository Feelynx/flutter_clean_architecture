import 'package:flutter_clean_architecture/data/dto/refresh_token_response_dto.dart';
import 'package:flutter_clean_architecture/domain/entities/base_entity.dart';

class RefreshTokenResponseEntity extends BaseEntity<RefreshTokenResponseDTO> {
  final String? accessToken;
  final String? refreshToken;

  const RefreshTokenResponseEntity({
    this.accessToken,
    this.refreshToken,
  });

  @override
  List<Object?> get props => [accessToken, refreshToken];

  @override
  RefreshTokenResponseDTO toDTO() => RefreshTokenResponseDTO(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
}
