import 'package:flutter_clean_architecture/data/data_exports.dart';
import 'package:flutter_clean_architecture/domain/entities/user/company_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'company_dto.g.dart';

@JsonSerializable(
  createToJson: true,
  explicitToJson: true,
)
class CompanyDTO extends BaseDTO<CompanyEntity> {
  final String? department;
  final String? name;
  final String? title;
  final AddressDTO? address;

  const CompanyDTO({
    this.department,
    this.name,
    this.title,
    this.address,
  });

  factory CompanyDTO.fromJson(Map<String, dynamic> json) => _$CompanyDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyDTOToJson(this);

  @override
  CompanyEntity toEntity() => CompanyEntity(
        department: department,
        name: name,
        title: title,
        address: address?.toEntity(),
      );

  @override
  List<Object?> get props => [
        department,
        name,
        title,
        address,
      ];
}
