import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';

class LocationItemWidget extends StatelessWidget {
  const LocationItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Location item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(item.name, overflow: TextOverflow.ellipsis),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Type: ${item.type}',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                'Dimension: ${item.dimension}',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
          leading: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.location_on_rounded,
              color: Colors.grey,
            ),
          ),
          contentPadding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
        ),
        const Divider(
          height: 0.7,
          thickness: 0.7,
        )
      ],
    );
  }
}