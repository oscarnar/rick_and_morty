import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/character_details/cubit/character_details_cubit.dart';
import 'package:rick_and_morty/character_details/widgets/character_card.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage({Key? key, @pathParam required this.id, this.name = ''})
      : super(key: key);
  final int id;
  final String name;

  @override
  Widget build(BuildContext context) {
    context.read<CharacterDetailsCubit>().loadDetails(id: id);
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<CharacterDetailsCubit, CharacterDetailsState>(
          key: UniqueKey(),
          builder: (context, state) {
            if(state is CharacterLoaded) {
              return Text(state.character!.name);
            }
            return Text(name);
          },
        ),
      ),
      body: BlocBuilder<CharacterDetailsCubit, CharacterDetailsState>(
        buildWhen: (previous, current) =>
            previous.character != current.character,
        builder: (context, state) {
          if (state is CharacterError) {
            return Center(
              child: Text(state.errorMessage!),
            );
          } else if (state is CharacterDetailsInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharacterLoaded) {
            var item = state.character;

            return Column(
              children: [
                PersonageCard(item: item!),
                const SizedBox(
                  height: 16,
                ),
              ],
            );
          } else {
            return const Text('Smt went wrong');
          }
        },
      ),
    );
  }
}
