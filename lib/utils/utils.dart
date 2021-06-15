import 'dart:convert';

import 'package:thingsboard_client/thingsboard_client.dart';

abstract class Utils {

  static String createDashboardEntityState(EntityId entityId, {String? entityName, String? entityLabel}) {
    var stateObj = [<String, dynamic>{
      'params': <String, dynamic>{
        'entityId': entityId.toJson()
      }
    }];
    if (entityName != null) {
      stateObj[0]['params']['entityName'] = entityName;
    }
    if (entityLabel != null) {
      stateObj[0]['params']['entityLabel'] = entityLabel;
    }
    var stateJson = json.encode(stateObj);
    var encodedUri =  Uri.encodeComponent(stateJson);
    encodedUri = encodedUri.replaceAllMapped(RegExp(r'%([0-9A-F]{2})'), (match) {
      var p1 = match.group(1)!;
      return String.fromCharCode(int.parse(p1, radix: 16));
    });
    return Uri.encodeComponent(
        base64.encode(utf8.encode(encodedUri))
    );
  }

  static String? contactToShortAddress(ContactBased contact) {
    var addressParts = <String>[];
    if (contact.country != null) {
      addressParts.add(contact.country!);
    }
    if (contact.city != null) {
      addressParts.add(contact.city!);
    }
    if (contact.address != null) {
      addressParts.add(contact.address!);
    }
    if (addressParts.isNotEmpty) {
      return addressParts.join(', ');
    } else {
      return null;
    }
  }

}
