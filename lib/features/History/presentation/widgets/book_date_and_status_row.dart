import 'package:flutter/material.dart';

class BookDateAndStatusRow extends StatelessWidget {
  const BookDateAndStatusRow({super.key, required this.status});
  final String status;

  @override
  Widget build(BuildContext context) {
    late final MaterialColor statusColor;
    if (status == "Active") {
      statusColor = Colors.green;
    } else if (status == "Completed") {
      statusColor = Colors.grey;
    } else if (status == "Canceled") {
      statusColor = Colors.red;
    } else {
      statusColor = Colors.grey;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text(
            "Oct 25 - Oct 28",
            textAlign: TextAlign.end,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: statusColor.withAlpha(100),
            ),

            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 6.0,
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
