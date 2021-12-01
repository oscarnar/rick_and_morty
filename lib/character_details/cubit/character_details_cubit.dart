import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';

part 'character_details_state.dart';

class CharacterDetailsCubit extends Cubit<CharacterDetailsState> {
  CharacterDetailsCubit() : super(const CharacterDetailsInitial());

  var characterService = CharacterService();
  int counter = 0;

  void loadDetails({required int id}) async {
    emit(const CharacterDetailsInitial());
    var list = await characterService.getListOfCharacters([id]);
    if (list.isEmpty) {
      emit(const CharacterError('Character no found'));
    } else {
      Character character = list.first;
      emit(CharacterLoaded(character));
    }
  }
}
