import 'package:flutter/material.dart';

List<Widget> stringToWidgets(
    {required String statement,
    required List<String> notations,
    required BuildContext context,
    required Widget Function(int widgetIndex, String string, BuildContext S)
        switchStatement}) {
  final startNotations = <String>[];
  final endNotations = <String>[];

  //FIXME Logic when the notation is not present in the statement
  //FIXME Logic when the notation(s) do not match with the ones in the statement
  //FIXME Logic when some of the notations in statement are not present in the list of notations

  for (var notation in notations) {
    startNotations.add('/start$notation');
    endNotations.add('/$notation');
  }
  statement = statement.replaceAll('/start', '/begin/start');
  statement = statement.replaceAll('/end', '/end/');

  final firstSplitTexts = statement.split('/begin');

  final secondSplitTexts = <String>[];

  for (var text in firstSplitTexts) {
    if (!text.contains('/end')) {
      secondSplitTexts.add(text.trim());
    } else {
      final splitText = text.split('/end');

      secondSplitTexts.add(splitText[0].trim());

      for (final endNotation in endNotations) {
        if (splitText[1].contains(endNotation)) {
          final text = splitText[1].replaceFirst(endNotation, '').trim();
          secondSplitTexts.add(text);
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

