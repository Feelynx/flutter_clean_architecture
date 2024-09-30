// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinatesDTO _$CoordinatesDTOFromJson(Map<String, dynamic> json) =>
    CoordinatesDTO(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinatesDTOToJson(CoordinatesDTO instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
