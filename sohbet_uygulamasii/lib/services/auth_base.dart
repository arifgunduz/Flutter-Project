
import 'package:sohbet_uygulamasii/model/user.dart';

abstract class AuthBase {
  Future<MyUser> getCurrentUser();
  Future<MyUser> singInAnonymously();
  Future<bool> signOut();
  Future<MyUser> signInWithGoogle();

  Future<MyUser> signInWithEmailandPassword(String email, String sifre);
  Future<MyUser> createUserWithEmailandPassword(String email, String sifre);
}
