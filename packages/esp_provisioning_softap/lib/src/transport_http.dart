import 'dart:async';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'transport.dart';
import 'package:string_validator/string_validator.dart';

class TransportHTTP implements Transport {
  String hostname;
  Duration timeout;
  Map<String, String> headers = new Map();
  var client = http.Client();

  TransportHTTP(
      {required this.hostname, this.timeout = const Duration(seconds: 10)}) {
    if (!isURL(hostname)) {
      throw FormatException('hostname should be an URL.');
    }

    headers["Content-type"] = "application/x-www-form-urlencoded";
    //header["Content-type"] =  "application/json";
    headers["Accept"] = "text/plain";
  }

  @override
  Future<bool> connect() async {
    return true;
  }

  @override
  Future<void> disconnect() async {
    client.close();
  }

  void _updateCookie(http.Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }

  @override
  Future<Uint8List?> sendReceive(String epName, Uint8List data) async {
    try {
      print("Connecting to " + hostname + "/" + epName);
      final response = await client
          .post(
              Uri.http(
                hostname,
                "/" + epName,
              ),
              headers: headers,
              body: data)
          .timeout(timeout)
          .onError((error, stackTrace) {
        print("onError");
        print(error.toString());
        print(stackTrace.toString());
        return Future.error(error!);
      });

      _updateCookie(response);
      if (response.statusCode == 200) {
        print('Connection successful');
        // client.close();
        final Uint8List body_bytes = response.bodyBytes;
        return body_bytes;
      } else {
        print('Connection failed – HTTP-Status ${response.statusCode}');
        throw Future.error(Exception("ESP Device doesn't repond. HTTP-Status ${response.statusCode}"));
      }
    } catch (e) {
      throw StateError('StateError in transport_http.dart – Connection error (${e.runtimeType.toString()})' + e.toString());
    }
  }
}
