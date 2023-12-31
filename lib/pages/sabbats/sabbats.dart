import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:witch_army_knife/main.dart';
import 'package:witch_army_knife/pages/sabbats/sabbat_list_item.dart';

class Sabbats extends StatelessWidget {
  const Sabbats({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListView(
        children: dataStore.sabbats.map((sabbat) => SabbatListItem(sabbat: sabbat)).toList(),
      ),
    );
  }
}
