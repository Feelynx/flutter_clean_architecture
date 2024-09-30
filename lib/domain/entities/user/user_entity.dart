import 'package:flutter_clean_architecture/data/dto/user/user_dto.dart';
import 'package:flutter_clean_architecture/domain/domain_exports.dart';

class UserEntity extends BaseEntity<UserDTO> {
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
  final HairEntity? hair;
  final String? ip;
  final AddressEntity? address;
  final String? macAddress;
  final String? university;
  final BankEntity? bank;
  final CompanyEntity? company;
  final String? ein;
  final String? ssn;
  final String? userAgent;
  final CryptoEntity? crypto;
  final String? role;

  const UserEntity({
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
  UserDTO toDTO() => UserDTO(
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
        hair: hair?.toDTO(),
        ip: ip,
        address: address?.toDTO(),
        macAddress: macAddress,
        university: university,
        bank: bank?.toDTO(),
        company: company?.toDTO(),
        ein: ein,
        ssn: ssn,
        userAgent: userAgent,
        crypto: crypto?.toDTO(),
        role: role,
      );
}
