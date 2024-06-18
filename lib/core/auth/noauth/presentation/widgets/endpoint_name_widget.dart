import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class EndpointNameWidget extends StatelessWidget {
  const EndpointNameWidget({required this.endpoint});

  final String endpoint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: Color(0xFF305680),
        ),
      ),
      padding: const EdgeInsets.all(5),
      child: Center(
        child: Text(
          WebUri(endpoint).host,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: Color(0xFF305680)),
        ),
      ),
    );
  }
}
