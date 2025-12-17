import 'package:book_it/features/History/presentation/widgets/bookings_container.dart';
import 'package:flutter/material.dart';

class CompletedTabView extends StatelessWidget {
  const CompletedTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return BookingsContainer(status: "Completed");
        },
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemCount: 3,
      ),
    );
  }
}
