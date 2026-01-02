import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:book_it/features/Owner/presentation/widgets/create_property_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreatePropertyView extends StatelessWidget {
  const CreatePropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Text(
          context.ownerloc.createProperty_title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: const CreatePropertyViewBody(),
    );
  }
}
