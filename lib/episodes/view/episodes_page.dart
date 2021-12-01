import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/episodes/cubit/episodes_cubit.dart';
import 'package:rick_and_morty/episodes/widgets/epidosde_item.dart';

class EpisodesPage extends StatelessWidget {
  const EpisodesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EpisodesCubit>(context).getEpisodes();
    return BlocBuilder<EpisodesCubit, EpisodesState>(
      builder: (context, state) {
        return (state is EpisodesLoading)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: state.episodes.length,
                itemBuilder: (context, int index) {
                  return EpisodeItem(
                    item: state.episodes[index],
                  );
                },
              );
      },
    );
  }
}
