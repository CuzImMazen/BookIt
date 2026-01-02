import 'package:book_it/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FilterButtonRow extends StatelessWidget {
  const FilterButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Book it",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),

        Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kPrimaryColor.withAlpha(200),
          ),
          child: IconButton(
            onPressed: () {
              context.push("/main/filter");
            },
            icon: Icon(Icons.tune, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
