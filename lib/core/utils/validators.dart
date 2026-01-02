import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

String? phoneValidator(BuildContext context, String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return context.auth.errPhoneEmpty;
  }
  if (value.length != 10) {
    return context.auth.errPhoneLength;
  }
  if (!value.startsWith("09")) {
    return context.auth.errPhoneInvalid;
  }
  return null;
}

String? passwordValidator(BuildContext context, String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return context.auth.errPasswordEmpty;
  }
  if (value.length < 8) {
    return context.auth.errPasswordLength;
  }
  return null;
}

String? nameValidator(BuildContext context, String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return context.auth.errNameEmpty;
  }
  if (value.length > 20) {
    return context.auth.errNameTooLong;
  }
  return null;
}

String? confirmPasswordValidator(
  BuildContext context,
  String? value,
  String password,
) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return context.auth.errConfirmPasswordEmpty;
  }
  if (value != password.trim()) {
    return context.auth.errPasswordsNotMatch;
  }
  return null;
}

String? dateOfBirthValidator(BuildContext context, String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return context.auth.errBirthDateEmpty;
  }
  return null;
}

String? cardNumberValidator(BuildContext context, String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return context.book.cardNumberRequired;
  }
  if (value.length < 12) {
    return context.book.cardNumberTooShort;
  }
  if (value.length > 19) {
    return context.book.cardNumberTooLong;
  }
  return null;
}

String? addressValidator(BuildContext context, String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return context.book.billingAddressRequired;
  }
  return null;
}

String? startDateValidator(BuildContext context, String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return context.book.startDateRequired;
  }
  return null;
}

String? endDateValidator(BuildContext context, String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return context.book.endDateRequired;
  }

  return null;
}

String? priceValidator(BuildContext context, String? value) {
  if (value == null || value.isEmpty) return context.ownerloc.requiredd;
  final intValue = int.tryParse(value);
  if (intValue == null) return context.ownerloc.mustBeNumber;
  if (intValue < 25 || intValue > 250) return context.ownerloc.priceRange;
  return null;
}

String? areaValidator(BuildContext context, String? value) {
  if (value == null || value.isEmpty) return context.ownerloc.requiredd;
  final intValue = int.tryParse(value);
  if (intValue == null) return context.ownerloc.mustBeNumber;
  if (intValue < 100 || intValue > 1000) return context.ownerloc.areaRange;
  return null;
}
