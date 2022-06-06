import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;
@injectableInit
Future<void> setupInjector() async {
  $initGetIt(getIt, environment: Environment.dev);

}
@module
abstract class MainModule {
  FirebaseAuth getFirebaseAuth()=> FirebaseAuth.instance;

  GoogleSignIn getGoogleSignIn()=> GoogleSignIn();

  FirebaseFirestore getFirebaseFirestore()=> FirebaseFirestore.instance;
}