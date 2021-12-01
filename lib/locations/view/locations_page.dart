import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/locations/cubit/locations_cubit.dart';
import 'package:rick_and_morty/locations/widgets/location_item.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<LocationsCubit>().getLocations();
    return Scaffold(
      body: Scrollbar(
        child: Center(
          child: BlocBuilder<LocationsCubit, LocationsState>(
            builder: (context, state) {
              if (state is LocationsError) {
                return Text(state.error ?? 'Error :c');
              } else if (state is LocationsIsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is LocationsLoaded) {
                var list = state.locations;
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, int index) {
                    return LocationItemWidget(item: list[index]);
                  },
                );
              }
              else {
                return const Text('An error has occurred');
              }
            },
          ),
        ),
      ),
    );
  }
}
