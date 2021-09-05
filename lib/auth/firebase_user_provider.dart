import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class BackupAppFirebaseUser {
  BackupAppFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

BackupAppFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<BackupAppFirebaseUser> backupAppFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<BackupAppFirebaseUser>(
        (user) => currentUser = BackupAppFirebaseUser(user));
