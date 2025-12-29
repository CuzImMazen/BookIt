part of 'owner_properties_cubit.dart';

@immutable
sealed class OwnerPropertiesState {}

final class OwnerInitial extends OwnerPropertiesState {}

class OwnerPropertiesLoading extends OwnerPropertiesState {}

class OwnerPropertiesLoaded extends OwnerPropertiesState {
  final List<PropertyModel> properties;

  OwnerPropertiesLoaded(this.properties);
}

class OwnerPropertiesError extends OwnerPropertiesState {
  final String message;

  OwnerPropertiesError(this.message);
}

final class OwnerPropertyDeleting extends OwnerPropertiesState {
  final int propertyId;
  OwnerPropertyDeleting(this.propertyId);
}

final class OwnerPropertyDeleteError extends OwnerPropertiesState {
  final String message;
  OwnerPropertyDeleteError(this.message);
}
