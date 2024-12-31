import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

sealed class LayoutPagesEvent extends Equatable {
  const LayoutPagesEvent();

  @override
  List<Object?> get props => [];
}

final class BottomBarFetchEvent extends LayoutPagesEvent {
  const BottomBarFetchEvent(this.context);

  final BuildContext context;
}

final class BottomBarOrientationChangedEvent extends LayoutPagesEvent {
  const BottomBarOrientationChangedEvent();
}
