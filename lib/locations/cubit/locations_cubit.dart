import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';

part 'locations_state.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit() : super(LocationsInitial());

  var locations = LocationService();

  Future<void> getLocations() async {
    emit(LocationsIsLoading());
    try {
      final AllLocations locations = await this.locations.getAllLocations();
      emit(LocationsLoaded(locations: locations.results));
    } catch (e) {
      emit(LocationsError(error: e.toString()));
    }
  }
}
