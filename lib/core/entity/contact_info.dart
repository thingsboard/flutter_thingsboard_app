import 'package:thingsboard_app/thingsboard_client.dart';

/// Typed view over the contact fields shared by [Customer] and [Tenant].
///
/// The generated built_value models expose identical contact getters but share
/// no common supertype, so this adapter replaces `dynamic` field access with a
/// compile-checked switch over the known contact-based entities.
class ContactInfo {
  const ContactInfo({
    required this.name,
    required this.email,
    required this.createdTime,
    required this.shortAddress,
  });

  factory ContactInfo._from({
    required String? name,
    required String? email,
    required int? createdTime,
    required String? country,
    required String? city,
    required String? address,
  }) {
    final parts = [country, city, address].whereType<String>().toList();
    return ContactInfo(
      name: name ?? '',
      email: email,
      createdTime: createdTime ?? 0,
      shortAddress: parts.isEmpty ? null : parts.join(', '),
    );
  }

  final String name;
  final String? email;
  final int createdTime;
  final String? shortAddress;

  static ContactInfo? of(Object? contact) {
    if (contact is Customer) {
      return ContactInfo._from(
        name: contact.name,
        email: contact.email,
        createdTime: contact.createdTime,
        country: contact.country,
        city: contact.city,
        address: contact.address,
      );
    }
    if (contact is Tenant) {
      return ContactInfo._from(
        name: contact.name,
        email: contact.email,
        createdTime: contact.createdTime,
        country: contact.country,
        city: contact.city,
        address: contact.address,
      );
    }
    return null;
  }
}
