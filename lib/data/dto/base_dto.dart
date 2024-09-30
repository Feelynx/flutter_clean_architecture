import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/data/datasources/mapper/dto_mapper_mixin.dart';

abstract class BaseDTO<I> extends Equatable with DTOMapperMixin<I> {
  const BaseDTO();
}
