import 'package:flutter_clean_architecture/data/dto/base_dto.dart';
import 'package:flutter_clean_architecture/data/dto/user/coordinates_dto.dart';
import 'package:flutter_clean_architecture/domain/entities/user/address_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_dto.g.dart';

@JsonSerializable(
  createToJson: true,
  explicitToJson: true,
)
class AddressDTO extends BaseDTO<AddressEntity> {
  final String? address;
  final String? city;
  final String? state;
  final String? stateCode;
  final String? postalCode;
  final CoordinatesDTO? coordinates;
  final String? country;

  const AddressDTO({
    this.address,
    this.city,
    this.state,
    this.stateCode,
    this.postalCode,
    this.coordinates,
    this.country,
  });

  factory AddressDTO.fromJson(Map<String, dynamic> json) => _$AddressDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDTOToJson(this);

  @override
  AddressEntity toEntity() => AddressEntity(
        address: address,
        city: city,
        state: state,
        stateCode: stateCode,
        postalCode: postalCode,
        coordinates: coordinates?.toEntity(),
        country: country,
      );

  @override
  List<Object?> get props => [
        address,
        city,
        state,
        stateCode,
        postalCode,
        coordinates,
        country,
      ];
}
