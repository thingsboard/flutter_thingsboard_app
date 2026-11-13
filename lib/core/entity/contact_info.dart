// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_client/thingsboard_client.dart';

/// Typed view over the contact fields shared by [Customer] and [Tenant]: the
/// generated models have identical getters but no common supertype.
class ContactInfo {
  const ContactInfo({
    required this.title,
    required this.createdTime,
    this.email,
    this.phone,
    this.country,
    this.state,
    this.city,
    this.zip,
    this.address,
    this.address2,
  });

  final String title;
  final int createdTime;
  final String? email;
  final String? phone;
  final String? country;
  final String? state;
  final String? city;
  final String? zip;
  final String? address;
  final String? address2;

  String? get shortAddress {
    final parts = [country, city, address].whereType<String>().toList();
    return parts.isEmpty ? null : parts.join(', ');
  }

  static ContactInfo? of(Object? contact) => switch (contact) {
    Customer() => ContactInfo(
      title: contact.title,
      createdTime: contact.createdTime ?? 0,
      email: contact.email,
      phone: contact.phone,
      country: contact.country,
      state: contact.state,
      city: contact.city,
      zip: contact.zip,
      address: contact.address,
      address2: contact.address2,
    ),
    Tenant() => ContactInfo(
      title: contact.title,
      createdTime: contact.createdTime ?? 0,
      email: contact.email,
      phone: contact.phone,
      country: contact.country,
      state: contact.state,
      city: contact.city,
      zip: contact.zip,
      address: contact.address,
      address2: contact.address2,
    ),
    _ => null,
  };
}
