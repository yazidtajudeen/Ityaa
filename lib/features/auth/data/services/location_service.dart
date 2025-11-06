import 'package:location/location.dart';
import '../datasources/location_local_datasource.dart';

class LocationService {
  final Location _location = Location();
  final LocationLocalDataSource _localDataSource;
  LocationService(this._localDataSource);

  Future<bool> requestAndSaveLocation() async {
    try {
      // 1. Service enabled?
      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) return false;
      }

      // 2. Permission
      PermissionStatus permission = await _location.hasPermission();
      if (permission == PermissionStatus.denied) {
        permission = await _location.requestPermission();
        if (permission != PermissionStatus.granted) return false;
      }

      // 3. Get location
      final locationData = await _location.getLocation();
      if (locationData.latitude == null || locationData.longitude == null) {
        return false;
      }

      // 4. Save
      await _localDataSource.saveLocation(
        locationData.latitude!,
        locationData.longitude!,
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
