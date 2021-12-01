import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';

class EpisodeItem extends StatelessWidget {
  const EpisodeItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Episode item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileTheme(
          // TODO: change bacgound color for dark mode
          child: ListTile(
            
            title: Text(item.name, overflow: TextOverflow.ellipsis),
            subtitle: Text(
              item.episode,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          ),
        ),
        const Divider(
          height: 0.7,
          thickness: 0.7,
        )
      ],
    );
  }
}