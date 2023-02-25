import 'package:flutter/material.dart';

List<Widget> stringToWidgets(
    {required String text,
    required List<String> notations,
    required BuildContext context,
    required Widget Function(int widgetIndex, String string, BuildContext S)
        switchStatement}) {
  final startNotations = <String>[];
  final endNotations = <String>[];

  for (var notation in notations) {
    startNotations.add('/start$notation');
    endNotations.add('/$notation');
  }
  text = text.replaceAll('/start', '/begin/start');
  text = text.replaceAll('/end', '/end/');

  final firstSplitTexts = text.split('/begin');

  final secondSplitTexts = <String>[];

  for (var splitStr in firstSplitTexts) {
    if (!splitStr.contains('/end')) {
      secondSplitTexts.add(splitStr.trim());
    } else {
      final str = splitStr.split('/end');

      secondSplitTexts.add(str[0].trim());

      for (final endNotation in endNotations) {
        if (str[1].contains(endNotation)) {
          final splitStr = str[1].replaceFirst(endNotation, '').trim();
          secondSplitTexts.add(splitStr);
        }
      }
    }
  }

  final listOfNotations =
      List.generate(secondSplitTexts.length, (index) => 'text');
  final indices =
      List.generate(secondSplitTexts.length, (index) => notations.length);

  for (var stringIndex = 0;
      stringIndex < secondSplitTexts.length;
      stringIndex++) {
    for (var notationIndex = 0;
        notationIndex < startNotations.length;
        notationIndex++) {
      if (secondSplitTexts[stringIndex]
          .contains(startNotations[notationIndex])) {
        listOfNotations[stringIndex] = notations[notationIndex];
        indices[stringIndex] = notationIndex;
      }
    }
  }

  final listOfStrings = <String>[];

  for (var string in secondSplitTexts) {
    if (!string.contains('/start')) {
      listOfStrings.add(string);
    } else {
      for (var notation in startNotations) {
        if (string.contains(notation)) {
          string = string.replaceAll(notation, '');
          listOfStrings.add(string);
        }
      }
    }
  }

  final listOfWidgets = <Widget>[];

  for (var stringIndex = 0; stringIndex < indices.length; stringIndex++) {
    final index = indices[stringIndex];
    final string = listOfStrings[stringIndex];
    Widget widget = const Placeholder();
    widget = switchStatement(index, string, context);
    listOfWidgets.add(widget);
  }

  return listOfWidgets;
}

