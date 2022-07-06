
import 'package:get_it/get_it.dart';
import 'package:sohbet_uygulamasii/repository/user_repository.dart';
import 'package:sohbet_uygulamasii/services/bildirim_gonderme_servis.dart';
import 'package:sohbet_uygulamasii/services/fake_auth_service.dart';
import 'package:sohbet_uygulamasii/services/firebase_auth_service.dart';
import 'package:sohbet_uygulamasii/services/firebase_storage_service.dart';
import 'package:sohbet_uygulamasii/services/firestore_db_service.dart';

GetIt locator = GetIt.I;  // GetIt.I -  GetIt.instance - nin kisaltmasidir

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => FakeAuthenticationService());
  locator.registerLazySingleton(() => FirestoreDBService());
  locator.registerLazySingleton(() => FirebaseStorageService());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => BildirimGondermeServis());
}
