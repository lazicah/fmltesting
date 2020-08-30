import 'package:geolocator/geolocator.dart';

import '../stoppable_service.dart';

/// Service that is responsible for geting location
abstract class LocationService implements StoppableService {
  Stream<Position> get positionStream;
}
