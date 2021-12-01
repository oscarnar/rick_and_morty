part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {
  final List<Character> characters;
  final bool isLoading;
  final String error;

  const CharactersState({
    required this.characters,
    required this.isLoading,
    this.error = '',
  });
}

class CharactersInitial extends CharactersState {
  CharactersInitial() : super(characters: [], isLoading: true);
}

class CharactersLoaded extends CharactersState {
  const CharactersLoaded(List<Character> characters)
      : super(characters: characters, isLoading: false);
}

class CharactersError extends CharactersState {
  CharactersError(String errorMessage)
      : super(characters: [], isLoading: false, error: errorMessage);
}

class CharactersLoading extends CharactersState {
  CharactersLoading() : super(characters: [], isLoading: true);
}
