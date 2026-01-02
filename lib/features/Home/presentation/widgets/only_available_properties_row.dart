import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

class OnlyAvailablePropertiesRow extends StatelessWidget {
  final bool onlyAvailable;
  final Function(bool?) onChanged;

  const OnlyAvailablePropertiesRow({
    super.key,
    required this.onlyAvailable,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          context.home.onlyShowAvailableProperties,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        Checkbox(value: onlyAvailable, onChanged: onChanged),
      ],
    );
  }
}
