import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TiNr22FirebaseUser {
  TiNr22FirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

TiNr22FirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TiNr22FirebaseUser> tiNr22FirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<TiNr22FirebaseUser>(
      (user) {
        currentUser = TiNr22FirebaseUser(user);
        return currentUser!;
      },
    );
