import 'package:bloc/bloc.dart';
import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:book_it/features/Home/data/repo/property_repo.dart';
import 'package:meta/meta.dart';

part 'property_state.dart';

class PropertyCubit extends Cubit<PropertyState> {
  final PropertyRepo _propertyRepo;

  PropertyCubit(this._propertyRepo) : super(PropertyInitial());

  Future<void> getProperties(Map<String, String> queryParameters) async {
    emit(PropertyLoading());
    final (properties, errorMessage) = await _propertyRepo.getProperties(
      queryParameters,
    );

    if (errorMessage != null) {
      emit(PropertyError(errorMessage));
    } else {
      emit(PropertyLoaded(properties));
    }
  }
}
