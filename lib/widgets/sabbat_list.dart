import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wheel_of_the_year/main.dart';
import 'package:wheel_of_the_year/widgets/sabbat_card.dart';

class SabbatList extends StatelessWidget {
  const SabbatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => ListView(
              children: getCards(),
            ));
  }

  List<Widget> getCards() {
    List<Widget> sabbats = List.of([]);
    for (final sabbat in sabbatStore.sabbats) {
      sabbats.add(SabbatCard(sabbat: sabbat));
    }

    return sabbats;
  }
}
