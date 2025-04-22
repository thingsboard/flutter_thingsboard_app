import 'package:equatable/equatable.dart';

class FilterDataEntity<T> extends Equatable {
  const FilterDataEntity({required this.label, required this.data});

  final String label;
  final T data;

  @override
  List<Object?> get props => [label, data];
}
