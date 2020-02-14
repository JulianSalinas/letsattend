import 'package:flutter/material.dart';

/// A simple colored screen with a centered text
class AboutView extends StatelessWidget {

  final String text;
  final Color color;

  AboutView({this.text, this.color});

  @override
  Widget build(BuildContext context) {

    /// The text is big due to being directly in a container
    final textStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    );

    final content = Center(
      child: Text(text.toUpperCase(), style: textStyle),
    );

    final container = Container(
      color: color,
      child: content,
    );

    return SafeArea(child: container);

  }
}
