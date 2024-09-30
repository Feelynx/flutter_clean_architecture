import 'package:flutter_clean_architecture/data/dto/user/bank_dto.dart';
import 'package:flutter_clean_architecture/domain/entities/base_entity.dart';

class BankEntity extends BaseEntity<BankDTO> {
  final String? cardExpire;
  final String? cardNumber;
  final String? cardType;
  final String? currency;
  final String? iban;

  const BankEntity({
    this.cardExpire,
    this.cardNumber,
    this.cardType,
    this.currency,
    this.iban,
  });

  @override
  List<Object?> get props => [
        cardExpire,
        cardNumber,
        cardType,
        currency,
        iban,
      ];

  @override
  BankDTO toDTO() => BankDTO(
        cardExpire: cardExpire,
        cardNumber: cardNumber,
        cardType: cardType,
        currency: currency,
        iban: iban,
      );
}
