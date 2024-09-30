import 'package:flutter_clean_architecture/data/dto/user/coordinates_dto.dart';
import 'package:flutter_clean_architecture/domain/entities/base_entity.dart';

class CoordinatesEntity extends BaseEntity<CoordinatesDTO> {
  final double? lat;
  final double? lng;

  const CoordinatesEntity({
    this.lat,
    this.lng,
  });

  @override
  List<Object?> get props => [
        lat,
        lng,
      ];

  @override
  CoordinatesDTO toDTO() => CoordinatesDTO(
        lat: lat,
        lng: lng,
      );
}
