part of 'layouts_bloc.dart';

@freezed
class LayoutsEvent with _$LayoutsEvent {
  const factory LayoutsEvent.fetch(BuildContext context) = BottomBarFetchEvent;

  const factory LayoutsEvent.orientationChanged(
    Orientation orientation,
    Size screenSize,
  ) = BottomBarOrientationChangedEvent;
}
