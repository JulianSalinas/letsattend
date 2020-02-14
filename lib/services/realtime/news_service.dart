import 'package:firebase_database/firebase_database.dart';
import 'package:letsattend/models/post.dart';
import 'package:letsattend/services/realtime/firebase_service.dart';

class NewsService extends FirebaseService<Post> {

  @override
  String get path => 'edepa6/news';

  @override
  Post fromFirebase(Event data) {
    DataSnapshot snapshot = data.snapshot;
    snapshot.value['key'] = snapshot.key;
    return Post.fromMap(snapshot.value);
  }

}
