import 'package:equatable/equatable.dart';

/// This class represents the arguments a user can pass to open a dashboard
class DashboardArgumentsEntity extends Equatable {
  const DashboardArgumentsEntity(
    this.id, {
    this.title,
    this.state,
    this.hideToolbar,
    this.animate = true,
  });

  final String id;
  final String? title;
  final String? state;
  final bool? hideToolbar;
  final bool animate;

  @override
  List<Object?> get props => [id, title, state, hideToolbar, animate];
}
