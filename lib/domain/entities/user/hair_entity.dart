import 'package:flutter_clean_architecture/data/dto/user/hair_dto.dart';
import 'package:flutter_clean_architecture/domain/entities/base_entity.dart';

class HairEntity extends BaseEntity<HairDTO> {
  final String? color;
  final String? type;

  const HairEntity({
    this.color,
    this.type,
  });

  @override
  List<Object?> get props => [
        color,
        type,
      ];

  @override
  HairDTO toDTO() => HairDTO(
        color: color,
        type: type,
      );
}
