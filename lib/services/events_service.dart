import 'dart:async';

import 'package:letsattend/locator.dart';
import 'package:letsattend/models/user.dart';
import 'package:letsattend/models/event.dart';
import 'package:letsattend/models/speaker.dart';

import 'package:letsattend/services/firebase_service.dart';
import 'package:letsattend/services/speakers_service.dart';
import 'package:letsattend/services/favorites_service.dart';
import 'package:firebase_database/firebase_database.dart' show DataSnapshot;

class EventsService extends FirebaseService<Event> {

  final SpeakersService _speakersService = locator<SpeakersService>();
  final FavoritesService _favoritesService = locator<FavoritesService>();

  StreamSubscription _favoriteAddedSubscription;
  StreamSubscription _favoriteRemovedSubscription;

  EventsService() : super('edepa6/schedule', orderBy: 'start') {
    auth.user.then(subscribeFavoritesChanges);
  }

  void subscribeFavoritesChanges(User user) {

    final reference = database
        .child('edepa6')
        .child('favorites')
        .child(user.key);

    _favoriteAddedSubscription = reference
        .onChildAdded
        .listen((data) => onFavoriteChanged(data, true));

    _favoriteRemovedSubscription = reference
      .onChildRemoved
      .listen((data) => onFavoriteChanged(data, false));
  }

  void onFavoriteChanged(dynamic data, bool isFavorite) {
    final find = (event) => event.key == data.snapshot.key;
    Event event = collection.firstWhere(find);
    event.isFavorite = isFavorite;
    _onCollectionChanged(event);
  }

  void _onCollectionChanged(Event event)  {
    int index = collection.indexOf(event);
    collection.removeAt(index);
    collection.insert(index, event);
    controller.add(collection);
  }

  Future<Speaker> getSpeaker(dynamic key) async {
    return _speakersService.getSpeaker(key);
  }

  @override
  Future<Event> castSnapshot(DataSnapshot snapshot) async {

    final data = snapshot.value;
    Map people = data['people'] ?? {};

    List<Speaker> speakers = await Future.wait(people.keys.map(getSpeaker));
    final isFavorite = await _favoritesService.isFavorite(snapshot.key);

    return Event(
      key: snapshot.key,
      code: data['id'],
      type: data['eventype'],
      title: data['title'],
      description: data['briefSpanish'],
      start: castMilliseconds(data['start']),
      end: castMilliseconds(data['end']),
      image: 'assets/tec_edificio_a4.jpg',
      location: data['location'],
      speakers: speakers,
      isFavorite: isFavorite,
    );

  }

  @override
  void close() {
    _favoriteAddedSubscription.cancel();
    _favoriteRemovedSubscription.cancel();
    super.close();
  }

}