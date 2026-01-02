import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:book_it/features/Home/data/models/filter_model.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/filter_cubit.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/property_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_container.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> categories = {
      "All": context.home.category_all,
      "House": context.home.category_house,
      "Villa": context.home.category_villa,
      "Apartment": context.home.category_apartment,
    };

    final List<String> keys = categories.keys.toList();

    return BlocBuilder<FilterCubit, FilterModel>(
      builder: (context, state) {
        final selectedCategory = state.selectedCategory;

        return SizedBox(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: keys.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final key = keys[index];
              final localizedText = categories[key]!;

              final isSelected = key == selectedCategory;

              return CategoryContainer(
                text: localizedText,
                isSelected: isSelected,
                onTap: () {
                  context.read<FilterCubit>().updateCategory(key);
                  final filterState = context.read<FilterCubit>().state;
                  final queryParams = filterState.toQueryParameters();
                  context.read<PropertyCubit>().getProperties(queryParams);
                },
              );
            },
          ),
        );
      },
    );
  }
}
