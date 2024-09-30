import 'package:flutter_clean_architecture/data/dto/base_dto.dart';
import 'package:flutter_clean_architecture/domain/entities/user/coordinates_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coordinates_dto.g.dart';

@JsonSerializable(
  createToJson: true,
  explicitToJson: true,
)
class CoordinatesDTO extends BaseDTO<CoordinatesEntity> {
  final double? lat;
  final double? lng;

  const CoordinatesDTO({
    this.lat,
    this.lng,
  });

  factory CoordinatesDTO.fromJson(Map<String, dynamic> json) => _$CoordinatesDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesDTOToJson(this);

  @override
  CoordinatesEntity toEntity() => CoordinatesEntity(
        lat: lat,
        lng: lng,
      );

  @override
  List<Object?> get props => [
        lat,
        lng,
      ];
}
