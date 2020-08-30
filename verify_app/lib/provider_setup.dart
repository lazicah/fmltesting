import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:verify_app/core/enums/connectivity_status.dart';
import 'package:verify_app/core/services/connectivity/connectivity_service.dart';
import 'package:verify_app/core/services/location/locationservice.dart';
import 'package:verify_app/ui/screens/verificationscreen/verificationmodel.dart';

import 'locator.dart';

/// List of providers that provider transforms into a widget tree
/// with the main app as the child of that tree, so that the entire
/// app can use these streams anywhere there is a [BuildContext]
List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [];

List<SingleChildWidget> dependentServices = [
  ChangeNotifierProvider<VerificationModel>(
      create: (context) => VerificationModel())
];

//Place All ChangeNotifierProvider's separated by a comma ","
List<SingleChildWidget> uiConsumableProviders = [
  StreamProvider<Position>.value(
      value: locator<LocationService>().positionStream),
  StreamProvider<ConnectivityStatus>(
    create: (context) => locator<ConnectivityService>().connectivity$,
  ),
];
