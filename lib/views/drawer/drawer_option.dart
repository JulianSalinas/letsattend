import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:letsattend/views/drawer/drawer_badge.dart';
import 'package:letsattend/view_models/navigation_model.dart';

class DrawerOption extends StatelessWidget {

  final IconData icon;
  final String title;
  final String route;
  final String badge;
  final Function onTap;

  const DrawerOption({
    Key key,
    @required this.icon,
    @required this.title,
    this.route,
    this.onTap,
    this.badge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    NavigationModel navigationModel = Provider.of<NavigationModel>(context);

    final onTap = this.onTap ?? () {
      navigationModel.goBack(); // close menu
      navigationModel.pushReplacement(route);
    };

    final content = Row(children: [
      Icon(icon),
      SizedBox(width: 12.0),
      Text(title, style: TextStyle(fontSize: 16.0)),
      Spacer(),
      if (badge != null) DrawerBadge(badge)
    ]);

    final container = Container(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: content,
    );

    return InkWell(
      onTap: onTap,
      child: container,
    );

  }

}