import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : super(CharactersInitial());

  final CharacterService _characterService = CharacterService();
  
  Future<void> getCharacters() async {
    try {
      emit(CharactersLoading());
      final AllCharacters characters = await _characterService.getAllCharacters();
      emit(CharactersLoaded(characters.results));
    } catch (e) {
      emit(CharactersError(e.toString()));
    }
  }
}
