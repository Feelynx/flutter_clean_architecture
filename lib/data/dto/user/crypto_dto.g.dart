// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoDTO _$CryptoDTOFromJson(Map<String, dynamic> json) => CryptoDTO(
      coin: json['coin'] as String?,
      wallet: json['wallet'] as String?,
      network: json['network'] as String?,
    );

Map<String, dynamic> _$CryptoDTOToJson(CryptoDTO instance) => <String, dynamic>{
      'coin': instance.coin,
      'wallet': instance.wallet,
      'network': instance.network,
    };
