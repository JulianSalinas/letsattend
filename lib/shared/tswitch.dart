import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:letsattend/colors/flat_ui.dart';
import 'package:letsattend/providers/scheme.dart';
import 'package:letsattend/shared/utext.dart';
import 'package:provider/provider.dart';

/// Switch used to change the theme scheme
/// It depends on the provider [scheme.dart]
class TSwitch extends StatelessWidget {

  final String text;
  final Color color;

  TSwitch({
    this.color,
    this.text = 'MODO OSCURO',
  });

  Widget build(BuildContext context) {

    /// Gets the properties for the switch
    final scheme = Provider.of<Scheme>(context);

    /// Cupertino switch also works on Android
    final switchComponent = CupertinoSwitch(
      value: scheme.darkMode,
      onChanged: scheme.onChangeDarkMode,
      activeColor: FlatUI.pomegranate,
    );

    final description = [
      Icon(MaterialCommunityIcons.weather_night),
      SizedBox(width: 16),
      UText(text),
    ];

    final content = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Row(children: description), switchComponent],
    );

    final container = Container(
      height: 48,
      child: content,
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      decoration: BoxDecoration(color: color),
    );

    /// It's wrapped 'cause it creates the effect of being static
    /// when switching between screens
    return Hero(
      tag: 'theme-switch-mkg',
      child: container,
    );

  }
}