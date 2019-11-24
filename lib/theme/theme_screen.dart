import 'package:flutter/material.dart';
import 'package:letsattend/screens/login.dart';
import 'package:letsattend/providers/palette.dart';
import 'package:letsattend/colors/ui_gradients.dart';
import 'package:letsattend/theme/theme_switch.dart';
import 'package:provider/provider.dart';


class ThemeScreen extends StatelessWidget {

    final Widget widget;

    ThemeScreen(this.widget);

    @override
    Widget build(BuildContext context) {

        Palette palette = Provider.of<Palette>(context);

        final boxDecoration = BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: UIGradients.kashmir
            )
        );

        final themeSwitch = ThemeSwitch(
            value: palette.darkMode,
            onChanged: palette.onChangeDarkMode
        );

        final flexibleWidget = Flexible(
            child: widget,
        );

        return Column(children: [flexibleWidget, themeSwitch]);

    }

}
