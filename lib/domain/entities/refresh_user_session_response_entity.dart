import 'package:flutter_clean_architecture/data/dto/refresh_user_session_response_dto.dart';
import 'package:flutter_clean_architecture/domain/entities/base_entity.dart';

class RefreshUserSessionResponseEntity extends BaseEntity<RefreshUserSessionResponseDTO> {
  final String? accessToken;
  final String? refreshToken;

  const RefreshUserSessionResponseEntity({
    this.accessToken,
    this.refreshToken,
  });

  @override
  List<Object?> get props => [accessToken, refreshToken];

  @override
  RefreshUserSessionResponseDTO toDTO() => RefreshUserSessionResponseDTO(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
}
