import 'package:flutter/foundation.dart';

abstract interface class ILoadingService {
  ValueNotifier<bool> get isLoading;

}
