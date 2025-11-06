import 'package:get_it/get_it.dart';
import 'package:itya_re/features/auth/data/datasources/location_local_datasource.dart';
import 'package:itya_re/features/auth/data/services/location_service.dart';
import 'package:itya_re/features/auth/data/repositories/location_repository_impl.dart';
import 'package:itya_re/features/auth/domain/repositories/location_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Data sources
  getIt.registerLazySingleton<LocationLocalDataSource>(
    () => LocationLocalDataSource(),
  );

  // Services
  getIt.registerLazySingleton<LocationService>(
    () => LocationService(getIt<LocationLocalDataSource>()),
  );

  // Repositories
  getIt.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(getIt<LocationService>()),
  );
}
