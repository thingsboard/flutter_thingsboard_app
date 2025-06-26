import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show AppLifecycleState;
import 'package:thingsboard_app/modules/device/provisioning/bloc/bloc.dart'
    show DeviceProvisioningStatus;
import 'package:thingsboard_app/thingsboard_client.dart' show User;

base class CommunicationEvent extends Equatable {
  const CommunicationEvent();

  @override
  List<Object?> get props => [];
}
