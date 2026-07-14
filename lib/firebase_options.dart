import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return web;
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB_fake_key_replace_with_real',
    appId: '1:123456789:web:fake_app_id',
    messagingSenderId: '123456789',
    projectId: 'live-app-gh',
    authDomain: 'live-app-gh.firebaseapp.com',
    storageBucket: 'live-app-gh.appspot.com',
  );
}
