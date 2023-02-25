<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Get a list of widgets from a string by splitting the string at the notation blocks 
as per switch case statement and notations referencing the widgets.

<!-- ## Features

By using this package you can easily generate list of widgets.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package. -->

## Usage

To use this plugin, add string_to_widgets as a dependency in your pubspec.yaml file.

```dart
        child: Column(
          children: stringToWidgets(
              text: text,
              notations: notations,
              context: context,
              switchStatement: _switchStatement),
        ),
```

<!-- ## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more. -->
