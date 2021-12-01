import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/router/routes.gr.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context)
            .push(CharacterDetailsPageRoute(id: character.id, name0: character.name));
        // AutoRouter.of(context).push(AppRouter.routes);
      },
      child: Card(
        child: Row(
          children: [
            SizedBox(
              height: 110,
              width: 110,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                child: Image.network(character.image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 142,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name,
                      overflow: TextOverflow.clip,
                      softWrap: false,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 8,
                          width: 8,
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                              color: character.status == 'Alive'
                                  ? Colors.green
                                  : Colors.red,
                              shape: BoxShape.circle),
                        ),
                        Text(
                          character.status,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          ' - ${character.species}',
                          overflow: TextOverflow.clip,
                          softWrap: false,
                          style: Theme.of(context).textTheme.subtitle1,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Last location:',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 14),
                      overflow: TextOverflow.clip,
                    ),
                    Text(
                      character.location.name,
                      style: Theme.of(context).textTheme.subtitle1,
                      overflow: TextOverflow.clip,
                      softWrap: false,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
