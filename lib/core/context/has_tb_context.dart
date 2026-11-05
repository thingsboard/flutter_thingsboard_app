// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

part of 'tb_context.dart';

mixin HasTbContext {
  late final TbContext _tbContext;
///TODO: refactor 
  // ignore: use_setters_to_change_properties
  void setTbContext(TbContext tbContext) {
    _tbContext = tbContext;
  }

  void setupCurrentState(TbContextState currentState) {
    if (_tbContext.currentState != null) {
      // ignore: deprecated_member_use
      ModalRoute.of(_tbContext.currentState!.context)
          ?.unregisterPopEntry(_tbContext);
    }
    _tbContext.currentState = currentState;
    if (_tbContext.currentState != null) {
      // ignore: deprecated_member_use
      ModalRoute.of(_tbContext.currentState!.context)
          ?.registerPopEntry(_tbContext);
    }
    if (_tbContext._closeMainFirst) {
      _tbContext._closeMainFirst = false;
      if (_tbContext.currentState != null) {
        _tbContext.currentState!.closeMainFirst = true;
      }
    }
  }

  void setupTbContext(TbContextState currentState) {
    _tbContext = currentState.widget.tbContext;
  }

  TbContext get tbContext => _tbContext;

  TbLogger get log => _tbContext.log;

  ValueNotifier<bool> get loadingNotifier => _tbContext._isLoadingNotifier;

  ThingsboardClient get tbClient => _tbContext.tbClient;


  Future<void> initTbContext() async {
    await _tbContext.init();
  }



 

  void subscribeRouteObserver(TbPageState pageState) {
    _tbContext.routeObserver
        .subscribe(pageState, ModalRoute.of(pageState.context)! as PageRoute);
  }

  void unsubscribeRouteObserver(TbPageState pageState) {
    _tbContext.routeObserver.unsubscribe(pageState);
  }
}
