part of 'layouts_bloc.dart';

@freezed
class LayoutsState with _$LayoutsState {
  const factory LayoutsState.loading() = BottomBarLoadingState;

  const factory LayoutsState.data({required List<TbMainNavigationItem> items}) =
      BottomBarDataState;
}
