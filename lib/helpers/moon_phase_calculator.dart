import 'package:witch_army_knife/models/lunar_phase.dart';
import 'package:witch_army_knife/models/lunar_phase_name.dart';

const _moonCycleLengthInDays = 29.53058867956790123457;

final List<LunarPhase> lunarPhases = [
  const LunarPhase(phaseLabel: 'New Moon', start: 0.0, end: 1.0, phaseName: LunarPhaseName.newMoon),
  const LunarPhase(
    phaseLabel: 'Waxing Crescent',
    start: 1.0,
    end: 6.38264692644001,
    phaseName: LunarPhaseName.waxingCrescent,
  ),
  const LunarPhase(
    phaseLabel: 'First Quarter',
    start: 6.38264692644001,
    end: 8.38264692644,
    phaseName: LunarPhaseName.firstQuarter,
  ),
  const LunarPhase(
    phaseLabel: 'Waxing Gibbous',
    start: 8.38264692644,
    end: 13.76529385288,
    phaseName: LunarPhaseName.waxingGibbous,
  ),
  const LunarPhase(phaseLabel: 'Full Moon', start: 13.76529385288, end: 15.76529385288, phaseName: LunarPhaseName.full),
  const LunarPhase(
    phaseLabel: 'Waning Gibbous',
    start: 15.76529385288,
    end: 21.14794077932,
    phaseName: LunarPhaseName.waningGibbous,
  ),
  const LunarPhase(
    phaseLabel: 'Last Quarter',
    start: 21.14794077932,
    end: 23.14794077932,
    phaseName: LunarPhaseName.lastQuarter,
  ),
  const LunarPhase(
    phaseLabel: 'Waning Crescent',
    start: 23.14794077932,
    end: 28.53058770576,
    phaseName: LunarPhaseName.waningCrescent,
  ),
  const LunarPhase(
    phaseLabel: 'New Moon',
    start: 28.53058770576,
    end: 29.53058770576,
    phaseName: LunarPhaseName.newMoon,
  ),
];

double _getMoonAge() {
  DateTime now = DateTime.now();
  double moonCycleLengthInSeconds = _moonCycleLengthInDays * 24 * 60 * 60;
  DateTime date = DateTime(now.year, now.month, now.day, now.hour, now.minute, now.second);

  // DateTime of a known new moon
  DateTime newMoon = DateTime(2023, 1, 21, 22, 53);

  double phase = ((date.millisecondsSinceEpoch - newMoon.millisecondsSinceEpoch) / 1000) % moonCycleLengthInSeconds;
  double moonAge = phase / (24 * 3600);
  return moonAge;
}

String getCurrentLunarPhase() {
  double moonAge = _getMoonAge();

  for (final phase in lunarPhases) {
    if (moonAge >= phase.start && moonAge < phase.end) {
      return phase.phaseLabel;
    }
  }
  return 'Invalid';
}

int daysUntilPhase({LunarPhaseName wantedPhase = LunarPhaseName.full}) {
  double moonAge = _getMoonAge();
  LunarPhase lunarPhase = lunarPhases.firstWhere((element) => element.phaseName == wantedPhase);

  double daysUntil = 0;
  if (moonAge < lunarPhase.end) {
    daysUntil = (lunarPhase.start - moonAge);
    daysUntil = daysUntil > 0 ? daysUntil : 0;
  } else {
    daysUntil = _moonCycleLengthInDays - (moonAge - lunarPhase.end);
  }

  DateTime now = DateTime.now();
  DateTime dateOfTheWantedPhase = now.add(Duration(milliseconds: (daysUntil * 24 * 60 * 60 * 1000).round()));

  return _daysBetween(now, dateOfTheWantedPhase);
}

String getLunarPhaseLabel(LunarPhaseName phaseName) {
  return lunarPhases.firstWhere((phase) => phase.phaseName == phaseName).phaseLabel ?? '';
}

int _daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}
