// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      maidenName: json['maidenName'] as String?,
      age: (json['age'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      birthDate: json['birthDate'] as String?,
      image: json['image'] as String?,
      bloodGroup: json['bloodGroup'] as String?,
      height: (json['height'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      eyeColor: json['eyeColor'] as String?,
      hair: json['hair'] == null
          ? null
          : HairDTO.fromJson(json['hair'] as Map<String, dynamic>),
      ip: json['ip'] as String?,
      address: json['address'] == null
          ? null
          : AddressDTO.fromJson(json['address'] as Map<String, dynamic>),
      macAddress: json['macAddress'] as String?,
      university: json['university'] as String?,
      bank: json['bank'] == null
          ? null
          : BankDTO.fromJson(json['bank'] as Map<String, dynamic>),
      company: json['company'] == null
          ? null
          : CompanyDTO.fromJson(json['company'] as Map<String, dynamic>),
      ein: json['ein'] as String?,
      ssn: json['ssn'] as String?,
      userAgent: json['userAgent'] as String?,
      crypto: json['crypto'] == null
          ? null
          : CryptoDTO.fromJson(json['crypto'] as Map<String, dynamic>),
      role: json['role'] as String?,
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'maidenName': instance.maidenName,
      'age': instance.age,
      'gender': instance.gender,
      'email': instance.email,
      'phone': instance.phone,
      'username': instance.username,
      'password': instance.password,
      'birthDate': instance.birthDate,
      'image': instance.image,
      'bloodGroup': instance.bloodGroup,
      'height': instance.height,
      'weight': instance.weight,
      'eyeColor': instance.eyeColor,
      'hair': instance.hair?.toJson(),
      'ip': instance.ip,
      'address': instance.address?.toJson(),
      'macAddress': instance.macAddress,
      'university': instance.university,
      'bank': instance.bank?.toJson(),
      'company': instance.company?.toJson(),
      'ein': instance.ein,
      'ssn': instance.ssn,
      'userAgent': instance.userAgent,
      'crypto': instance.crypto?.toJson(),
      'role': instance.role,
    };
