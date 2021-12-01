import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/characters/cubit/characters_cubit.dart';
import 'package:rick_and_morty/characters/widgets/character_item.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context).getCharacters();
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (BuildContext context, state) {
        if(state is CharactersError) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is CharactersLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: state.characters.length,
          itemBuilder: (_, index) => CharacterItem(
            character: state.characters[index],
          ),
        );
      },
    );
  }
}
