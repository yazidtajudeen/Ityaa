import 'package:itya_re/features/auth/data/services/location_service.dart';
import 'package:itya_re/features/auth/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationService _service;

  LocationRepositoryImpl(this._service);

  @override
  Future<bool> requestAndSaveLocation() => _service.requestAndSaveLocation();
}
