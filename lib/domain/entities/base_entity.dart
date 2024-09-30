import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/data/datasources/mapper/entity_mapper_mixin.dart';

abstract class BaseEntity<I> extends Equatable with EntityMapperMixin<I> {
  const BaseEntity();
}
