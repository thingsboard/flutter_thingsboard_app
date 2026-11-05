import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/core/entity/contact_info.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

void main() {
  test('reads every contact field of a customer', () {
    final info = ContactInfo.of(
      Customer(
        (b) => b
          ..title = 'Acme'
          ..createdTime = 5
          ..email = 'a@acme.io'
          ..phone = '+1'
          ..country = 'UA'
          ..state = 'Kyiv'
          ..city = 'Kyiv'
          ..zip = '01001'
          ..address = 'Main 1'
          ..address2 = 'Floor 2',
      ),
    )!;

    expect(info.title, 'Acme');
    expect(info.createdTime, 5);
    expect(
      [info.email, info.phone, info.state, info.zip, info.address2],
      ['a@acme.io', '+1', 'Kyiv', '01001', 'Floor 2'],
    );
    expect(info.shortAddress, 'UA, Kyiv, Main 1');
  });

  test('reads a tenant and skips missing address parts', () {
    final info = ContactInfo.of(
      Tenant(
        (b) => b
          ..title = 'Tenant A'
          ..city = 'Lviv',
      ),
    )!;

    expect(info.title, 'Tenant A');
    expect(info.createdTime, 0);
    expect(info.shortAddress, 'Lviv');
  });

  test('is null for other entities', () {
    expect(ContactInfo.of(Asset((b) => b..name = 'a')), isNull);
  });
}
