import 'package:flutter_clean_architecture/data/dto/refresh_user_session_request_dto.dart';
import 'package:flutter_clean_architecture/domain/entities/base_entity.dart';

class RefreshUserSessionRequestEntity extends BaseEntity<RefreshUserSessionRequestDTO> {
  final String refreshToken;
  final int? expiresInMins;

  const RefreshUserSessionRequestEntity({
    required this.refreshToken,
    this.expiresInMins,
  });

  @override
  List<Object?> get props => [refreshToken, expiresInMins];

  @override
  RefreshUserSessionRequestDTO toDTO() {
    return RefreshUserSessionRequestDTO(
      refreshToken: refreshToken,
      expiresInMins: expiresInMins,
    );
  }
}
