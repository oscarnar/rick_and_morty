import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';

class PersonageCard extends StatelessWidget {
  const PersonageCard({Key? key, required this.item}) : super(key: key);
  final Character item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 24),
            child: SizedBox(
              width: 200,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: Image.network(
                  item.image,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      margin: const EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(
                          color: item.status == 'Alive'
                              ? Colors.green
                              : Colors.red,
                          shape: BoxShape.circle),
                    ),
                    Text(
                      item.status,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      ' - ${item.species}',
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Origin location:',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 14),
                ),
                Text(
                  item.origin.name,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Last location:',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 14),
                ),
                Text(
                  item.location.name,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
