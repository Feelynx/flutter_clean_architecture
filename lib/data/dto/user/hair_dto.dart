import 'package:flutter_clean_architecture/data/dto/base_dto.dart';
import 'package:flutter_clean_architecture/domain/entities/user/hair_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hair_dto.g.dart';

@JsonSerializable(
  createToJson: true,
  explicitToJson: true,
)
class HairDTO extends BaseDTO<HairEntity> {
  final String? color;
  final String? type;

  const HairDTO({
    this.color,
    this.type,
  });

  factory HairDTO.fromJson(Map<String, dynamic> json) => _$HairDTOFromJson(json);

  Map<String, dynamic> toJson() => _$HairDTOToJson(this);

  @override
  HairEntity toEntity() => HairEntity(
        color: color,
        type: type,
      );

  @override
  List<Object?> get props => [
        color,
        type,
      ];
}
