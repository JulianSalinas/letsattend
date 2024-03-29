import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letsattend/models/event.dart';
import 'package:letsattend/views/events/event_widget/event_speakers.dart';

/// A simple colored screen with a centered text
class DetailContent extends StatelessWidget {

  // TODO: Remote after putting the event
  static final String title = "title";
  static final String abstract = "abstract";

  final Event event;

  DetailContent({ required this.event });

  @override
  Widget build(BuildContext context) {

    final itemPeople = ItemPeople(
        speakers: event.speakers
    );

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            Hero(
              tag: 'event-title-${event.key}',
              child: Text(event.title, style: Typography.englishLike2018.headline6,)
            ),
            SizedBox(
              height: 8,
            ),
            itemPeople,
            Divider(
              thickness: 2,
              height: 32,
            ),
            Text(
              'Abstract',
              style: TextStyle(
                  fontWeight: FontWeight.w300, fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              DetailContent.abstract,
              style: Typography.englishLike2018.bodyText1,
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );

  }

}
