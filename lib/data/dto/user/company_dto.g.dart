// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyDTO _$CompanyDTOFromJson(Map<String, dynamic> json) => CompanyDTO(
      department: json['department'] as String?,
      name: json['name'] as String?,
      title: json['title'] as String?,
      address: json['address'] == null
          ? null
          : AddressDTO.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompanyDTOToJson(CompanyDTO instance) =>
    <String, dynamic>{
      'department': instance.department,
      'name': instance.name,
      'title': instance.title,
      'address': instance.address?.toJson(),
    };
