import 'package:flutter/material.dart';
import 'package:witch_army_knife/helper-widgets/content_container.dart';
import 'package:witch_army_knife/helpers/moon_phase_calculator.dart';
import 'package:witch_army_knife/helpers/sizes.dart';
import 'package:witch_army_knife/main.dart';
import 'package:witch_army_knife/pages/home/moon_phase/moon_widget.dart';
import 'package:witch_army_knife/pages/home/moon_single.dart';

class MoonCard extends StatelessWidget {
  const MoonCard({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();

    return InkWell(
      splashColor: Colors.red,
      onTap: () {
        dataStore.setSelectedSabbat(dataStore.closestSabbat);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const MoonSingle(),
          ),
        );
      },
      child: ContentContainer(
        child: Center(
          child: Column(
            children: [
              const Text(
                'Current moon phase',
                style: TextStyle(fontSize: mainHeaderSize),
              ),
              MoonWidget(
                date: DateTime(now.year, now.month, now.day),
                resolution: 50,
                size: 80,
                earthShineColor: Colors.blueGrey.shade900,
                hemisphere: settingsStore.hemisphere,
              ),
              Text(
                getCurrentLunarPhase(),
                style: const TextStyle(fontSize: textSize),
              ),
              Text(
                'Next full moon is in ${daysUntilPhase()} day(s)',
                style: const TextStyle(fontSize: smallTextSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
