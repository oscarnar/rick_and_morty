part of 'episodes_cubit.dart';

@immutable
abstract class EpisodesState {
  final List<Episode> episodes;
  final bool isLoading;

  const EpisodesState({
    required this.episodes,
    required this.isLoading,
  });
}

class EpisodesInitial extends EpisodesState {
  EpisodesInitial() : super(episodes: [], isLoading: false);
}

class EpisodesLoading extends EpisodesState {
  EpisodesLoading() : super(episodes: [], isLoading: true);
}

class EpisodesLoaded extends EpisodesState {
  const EpisodesLoaded(episodes) : super(episodes: episodes, isLoading: false);
}

class EpisodesError extends EpisodesState {
  EpisodesError() : super(episodes: [], isLoading: false);
}