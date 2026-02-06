
import 'package:flutter/material.dart';
import 'package:thingsboard_app/utils/services/loading_service/i_loading_service.dart';

class LoadingService implements ILoadingService {
  final _isLoading = ValueNotifier(false);
  @override
  ValueNotifier<bool> get isLoading => _isLoading;
}
