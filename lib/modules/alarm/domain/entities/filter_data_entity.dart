import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class FilterDataEntity<T> extends Equatable {
  const FilterDataEntity( { required this.getLocalizedLabel, required this.data});


  final T data;
  final String Function(BuildContext context) getLocalizedLabel;
  @override
  List<Object?> get props => [ data];
}
