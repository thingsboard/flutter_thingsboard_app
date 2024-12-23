import 'package:equatable/equatable.dart';
import 'package:thingsboard_app/modules/main/main_navigation_item.dart';

sealed class LayoutPagesState extends Equatable {
  const LayoutPagesState();

  @override
  List<Object?> get props => [];
}

final class BottomBarLoadingState extends LayoutPagesState {
  const BottomBarLoadingState();
}

final class BottomBarDataState extends LayoutPagesState {
  const BottomBarDataState({required this.items});

  final List<TbMainNavigationItem> items;

  @override
  List<Object?> get props => [items];
}
