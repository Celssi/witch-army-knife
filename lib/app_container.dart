import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:witch_army_knife/helper-widgets/main_scaffold.dart';
import 'package:witch_army_knife/main.dart';
import 'package:witch_army_knife/pages/home/home.dart';
import 'package:witch_army_knife/pages/library/library.dart';
import 'package:witch_army_knife/pages/sabbats/sabbats.dart';
import 'package:witch_army_knife/pages/settings/settings.dart';
import 'package:witch_army_knife/pages/tarot/tarot.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Observer(
        builder: (_) => Container(child: getActiveWidget(dataStore.selectedTab)),
      ),
      showBottomButtons: true,
    );
  }

  Widget getActiveWidget(int index) {
    switch (index) {
      case 0:
        return const Home();
      case 1:
        return const Sabbats();
      case 2:
        return const Tarot();
      case 3:
        return const Library();
      case 4:
        return const Settings();
    }

    return const Home();
  }
}
