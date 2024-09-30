import 'package:flutter_clean_architecture/data/data_exports.dart';
import 'package:flutter_clean_architecture/domain/entities/user/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable(
  createToJson: true,
  explicitToJson: true,
)
class UserDTO extends BaseDTO<UserEntity> {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? maidenName;
  final int? age;
  final String? gender;
  final String? email;
  final String? phone;
  final String? username;
  final String? password;
  final String? birthDate;
  final String? image;
  final String? bloodGroup;
  final double? height;
  final double? weight;
  final String? eyeColor;
  final HairDTO? hair;
  final String? ip;
  final AddressDTO? address;
  final String? macAddress;
  final String? university;
  final BankDTO? bank;
  final CompanyDTO? company;
  final String? ein;
  final String? ssn;
  final String? userAgent;
  final CryptoDTO? crypto;
  final String? role;

  const UserDTO({
    this.id,
    this.firstName,
    this.lastName,
    this.maidenName,
    this.age,
    this.gender,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.birthDate,
    this.image,
    this.bloodGroup,
    this.height,
    this.weight,
    this.eyeColor,
    this.hair,
    this.ip,
    this.address,
    this.macAddress,
    this.university,
    this.bank,
    this.company,
    this.ein,
    this.ssn,
    this.userAgent,
    this.crypto,
    this.role,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        maidenName,
        age,
        gender,
        email,
        phone,
        username,
        password,
        birthDate,
        image,
        bloodGroup,
        height,
        weight,
        eyeColor,
        hair,
        ip,
        address,
        macAddress,
        university,
        bank,
        company,
        ein,
        ssn,
        userAgent,
        crypto,
        role,
      ];

  @override
  UserEntity toEntity() => UserEntity(
        id: id,
        firstName: firstName,
        lastName: lastName,
        maidenName: maidenName,
        age: age,
        gender: gender,
        email: email,
        phone: phone,
        username: username,
        password: password,
        birthDate: birthDate,
        image: image,
        bloodGroup: bloodGroup,
        height: height,
        weight: weight,
        eyeColor: eyeColor,
        hair: hair?.toEntity(),
        ip: ip,
        address: address?.toEntity(),
        macAddress: macAddress,
        university: university,
        bank: bank?.toEntity(),
        company: company?.toEntity(),
        ein: ein,
        ssn: ssn,
        userAgent: userAgent,
        crypto: crypto?.toEntity(),
        role: role,
      );
}
