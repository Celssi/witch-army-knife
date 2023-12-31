import 'package:witch_army_knife/models/hemisphere.dart';
import 'package:witch_army_knife/models/sabbat.dart';
import 'package:witch_army_knife/models/season_event.dart';

Map<String, SeasonEvent> seasonEventMap = {
  'Imbolc': SeasonEvent.imbolc,
  'Ostara': SeasonEvent.ostara,
  'Beltane': SeasonEvent.beltane,
  'Litha': SeasonEvent.litha,
  'Lughnasa': SeasonEvent.lughnasa,
  'Mabon': SeasonEvent.mabon,
  'Samhain': SeasonEvent.samhain,
  'Yule': SeasonEvent.yule,
};

DateTime calculateSeasonEvent(
  int year,
  SeasonEvent event, {
  Hemisphere hemisphere = Hemisphere.northern,
}) {
  if (hemisphere == Hemisphere.northern) {
    switch (event) {
      case SeasonEvent.imbolc:
        return DateTime.parse('$year-02-01');
      case SeasonEvent.ostara:
        return DateTime(
          year,
          3,
          20 + (0.2422 * (year - 1980)).floor() - ((year - 1980) / 4).floor(),
        );
      case SeasonEvent.beltane:
        return DateTime.parse('$year-05-01');
      case SeasonEvent.litha:
        return DateTime(
          year,
          6,
          21 + (0.2422 * (year - 1980)).floor() - ((year - 1980) / 4).floor(),
        );
      case SeasonEvent.lughnasa:
        return DateTime.parse('$year-08-01');
      case SeasonEvent.mabon:
        return DateTime(
          year,
          9,
          23 + (0.2422 * (year - 1980)).floor() - ((year - 1980) / 4).floor(),
        );
      case SeasonEvent.samhain:
        return DateTime.parse('$year-11-01');
      case SeasonEvent.yule:
        return DateTime(
          year,
          12,
          22 + (0.2422 * (year - 1980)).floor() - ((year - 1980) / 4).floor(),
        );
      default:
        throw ArgumentError("Invalid SeasonEvent value");
    }
  } else {
    switch (event) {
      case SeasonEvent.lughnasa:
        return DateTime.parse('$year-02-01');
      case SeasonEvent.mabon:
        return DateTime(
          year,
          3,
          20 + (0.2422 * (year - 1980)).floor() - ((year - 1980) / 4).floor(),
        );
      case SeasonEvent.samhain:
        return DateTime.parse('$year-05-01');
      case SeasonEvent.yule:
        return DateTime(
          year,
          6,
          21 + (0.2422 * (year - 1980)).floor() - ((year - 1980) / 4).floor(),
        );
      case SeasonEvent.imbolc:
        return DateTime.parse('$year-08-01');
      case SeasonEvent.ostara:
        return DateTime(
          year,
          9,
          23 + (0.2422 * (year - 1980)).floor() - ((year - 1980) / 4).floor(),
        );
      case SeasonEvent.beltane:
        return DateTime.parse('$year-11-01');
      case SeasonEvent.litha:
        return DateTime(
          year,
          12,
          22 + (0.2422 * (year - 1980)).floor() - ((year - 1980) / 4).floor(),
        );
      default:
        throw ArgumentError("Invalid SeasonEvent value");
    }
  }
}

List<Sabbat> getSabbats({Hemisphere hemisphere = Hemisphere.northern}) {
  DateTime now = DateTime.now();
  var sabbats = seasonEventMap.keys
      .map(
        (sabbatName) => Sabbat(
          date: calculateSeasonEvent(
            now.year,
            seasonEventMap[sabbatName]!,
            hemisphere: hemisphere,
          ),
          name: sabbatName,
        ),
      )
      .toList();

  for (var i = 0; i < sabbats.length; i++) {
    if (sabbats[i].date.isBefore(now)) {
      sabbats[i] = sabbats[i].copyWith(date: calculateSeasonEvent(now.year + 1, seasonEventMap[sabbats[i].name]!));
    }
  }

  sabbats.sort((a, b) => a.date.compareTo(b.date));

  return sabbats;
}
