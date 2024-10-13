import 'package:fruity/core/services/firebase_auth_service.dart';
import 'package:fruity/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:fruity/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerLazySingleton<Logger>(() => Logger());
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
      AuthRepoImpl(firebaseAuthService: getIt<FirebaseAuthService>()));
  // getIt.registerLazySingleton<Logger>(() => Logger());
  // getIt.registerSingleton<Logger>(Logger());
}
