import 'package:flutter/material.dart';
import 'package:witch_army_knife/main.dart';

class SabbatCard extends StatelessWidget {
  const SabbatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        children: <Widget>[
          const Text(
            'The next sabbat is',
            style: TextStyle(fontSize: 35),
          ),
          Text(
            dataStore.sabbats.isNotEmpty ? dataStore.closestSabbat.name : '-',
            style: const TextStyle(fontSize: 48),
          ),
          Text(
            dataStore.sabbats.isNotEmpty
                ? dataStore.daysUntilNextSabbat == 0
                    ? 'Today!'
                    : 'Which is in ${dataStore.daysUntilNextSabbat} days'
                : '-',
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}