import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AppAgilizeeFirebaseUser {
  AppAgilizeeFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

AppAgilizeeFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AppAgilizeeFirebaseUser> appAgilizeeFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<AppAgilizeeFirebaseUser>(
        (user) => currentUser = AppAgilizeeFirebaseUser(user));
