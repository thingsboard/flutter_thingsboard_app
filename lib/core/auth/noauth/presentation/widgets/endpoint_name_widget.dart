import 'package:flutter/material.dart';

class EndpointNameWidget extends StatelessWidget {
  const EndpointNameWidget({required this.endpoint, super.key});

  final String endpoint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
      ),
      padding: const EdgeInsets.all(5),
      child: Center(
        child: Text(
          Uri.parse(endpoint).host,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
