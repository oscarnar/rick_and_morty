part of 'locations_cubit.dart';

abstract class LocationsState extends Equatable {
  const LocationsState({this.error = '', this.locations});

  final String? error;
  final List<Location>? locations; 

  @override
  List<Object> get props => [];
}

class LocationsInitial extends LocationsState {}

class LocationsError extends LocationsState {
  const LocationsError({required String error}): super(error: error);
}

class LocationsIsLoading extends LocationsState {}

class LocationsLoaded extends LocationsState{
  const LocationsLoaded({required this.locations});

  @override
  final List<Location> locations;
}
