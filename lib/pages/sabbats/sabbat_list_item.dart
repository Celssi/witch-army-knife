import 'package:flutter/material.dart';
import 'package:witch_army_knife/helper-widgets/background_container.dart';
import 'package:witch_army_knife/helper-widgets/content_container.dart';
import 'package:witch_army_knife/helpers/sizes.dart';
import 'package:witch_army_knife/main.dart';
import 'package:witch_army_knife/models/sabbat.dart';
import 'package:witch_army_knife/pages/sabbats/sabbat_single.dart';

class SabbatListItem extends StatelessWidget {
  const SabbatListItem({
    required this.sabbat,
    super.key,
  });

  final Sabbat sabbat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.red,
      onTap: () {
        dataStore.setSelectedSabbat(sabbat);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SabbatSingle(),
          ),
        );
      },
      child: Hero(
        tag: sabbat.name,
        child: Card(
          child: BackgroundContainer(
            backgroundImage: 'assets/images/${sabbat.name}.png',
            child: ContentContainer(
              child: Column(
                children: <Widget>[
                  Text(
                    sabbat.name,
                    style: const TextStyle(fontSize: mainHeaderSize),
                  ),
                  Text(
                    '${sabbat.date.day}.${sabbat.date.month}.${sabbat.date.year}',
                    style: const TextStyle(fontSize: smallTextSize),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
