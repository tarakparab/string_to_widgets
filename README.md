Get a list of widgets from a string by splitting the string at the notation blocks 
as per switch case statement and notations referencing the widgets.


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


