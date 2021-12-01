part of 'character_details_cubit.dart';

@immutable
abstract class CharacterDetailsState {
  final Character? character;
  final String? errorMessage;

  const CharacterDetailsState({this.character,this.errorMessage});
}

class CharacterDetailsInitial extends CharacterDetailsState {
  const CharacterDetailsInitial() : super();
}

class CharacterLoaded extends CharacterDetailsState {
  const CharacterLoaded(Character character) : super(character: character);
}

class CharacterError extends CharacterDetailsState {
  const CharacterError(String error) : super(errorMessage: error);
}
