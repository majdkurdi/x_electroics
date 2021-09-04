import 'package:location/location.dart';
import '../modals/location.dart' as LocationModal;

class LocationService {
  Location location = Location();
  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  Future<LocationModal.Location?> getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();
    if (_locationData == null ||
        _locationData?.latitude == null ||
        _locationData?.longitude == null) {
      return null;
    }
    return LocationModal.Location(
        _locationData!.latitude!, _locationData!.longitude!);
  }
}
