import 'package:letsattend/models/speaker.dart';

class Event {

  final String key;
  final String code;

  final String type;
  final String title;

  final DateTime start;
  final DateTime end;

  final String? image;
  final String? location;
  final String? description;

  bool isFavorite;
  List<Speaker> speakers = [];

  Event({
    required this.key,
    required this.code,
    required this.type,
    required this.title,
    required this.start,
    required this.end,
    this.image,
    this.location,
    this.description,
    this.isFavorite = false,
  });

  @override
  int get hashCode => key.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is Event && key == other.key;
  }

  @override
  String toString() {
    return 'Event{ code: $code, type: $type, title: $title }';
  }

}
