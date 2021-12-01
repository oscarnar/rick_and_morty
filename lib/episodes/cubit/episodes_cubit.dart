import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';

part 'episodes_state.dart';

class EpisodesCubit extends Cubit<EpisodesState> {
  EpisodesCubit() : super(EpisodesInitial());

  EpisodeService episodeService = EpisodeService();

  Future<void> getEpisodes() async {
    try {
      emit(EpisodesLoading());
      final AllEpisodes episodes = await episodeService.getAllEpisodes();
      emit(EpisodesLoaded(episodes.results));
    } catch (e) {
      emit(EpisodesError());
    }
  }
}


