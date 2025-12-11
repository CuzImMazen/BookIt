import 'package:flutter/material.dart';
import 'package:book_it/core/style/colors.dart';

class FeatureCounterRow extends StatelessWidget {
  final String text;
  final int? value;
  final Function(int?) onChanged;

  const FeatureCounterRow({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final displayValue = value == null ? "Any" : value.toString();

    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(flex: 2),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withAlpha(25),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  if (value != null && value! > 1) {
                    onChanged(value! - 1);
                  } else {}
                },
                icon: const Icon(Icons.remove, color: kPrimaryColor),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(displayValue, style: const TextStyle(fontSize: 16)),
              ),
              IconButton(
                onPressed: () {
                  if (value == null) {
                    onChanged(1);
                  } else if (value! < 10) {
                    onChanged(value! + 1);
                  }
                },
                icon: const Icon(Icons.add, color: kPrimaryColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
