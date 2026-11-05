import 'package:thingsboard_client/thingsboard_client.dart';

/// Typed view over the contact fields shared by [Customer] and [Tenant].
///
/// The generated built_value models expose identical contact getters but share
/// no common supertype, so this adapter gives the contact screens one
/// compile-checked type instead of `dynamic` field access.
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

  /// Country, city and address, as the list cards show them.
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
