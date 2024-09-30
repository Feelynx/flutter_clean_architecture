import 'package:flutter_clean_architecture/data/dto/user/address_dto.dart';
import 'package:flutter_clean_architecture/domain/domain_exports.dart';

class AddressEntity extends BaseEntity<AddressDTO> {
  final String? address;
  final String? city;
  final String? state;
  final String? stateCode;
  final String? postalCode;
  final CoordinatesEntity? coordinates;
  final String? country;

  const AddressEntity({
    this.address,
    this.city,
    this.state,
    this.stateCode,
    this.postalCode,
    this.coordinates,
    this.country,
  });

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

  @override
  AddressDTO toDTO() => AddressDTO(
        address: address,
        city: city,
        state: state,
        stateCode: stateCode,
        postalCode: postalCode,
        coordinates: coordinates?.toDTO(),
        country: country,
      );
}
