import 'package:flutter_clean_architecture/data/dto/base_dto.dart';
import 'package:flutter_clean_architecture/domain/entities/user/bank_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bank_dto.g.dart';

@JsonSerializable(
  createToJson: true,
  explicitToJson: true,
)
class BankDTO extends BaseDTO<BankEntity> {
  final String? cardExpire;
  final String? cardNumber;
  final String? cardType;
  final String? currency;
  final String? iban;

  const BankDTO({
    this.cardExpire,
    this.cardNumber,
    this.cardType,
    this.currency,
    this.iban,
  });

  factory BankDTO.fromJson(Map<String, dynamic> json) => _$BankDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BankDTOToJson(this);

  @override
  BankEntity toEntity() => BankEntity(
        cardExpire: cardExpire,
        cardNumber: cardNumber,
        cardType: cardType,
        currency: currency,
        iban: iban,
      );

  @override
  List<Object?> get props => [
        cardExpire,
        cardNumber,
        cardType,
        currency,
        iban,
      ];
}
