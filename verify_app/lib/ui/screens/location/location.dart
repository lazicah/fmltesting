import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:verify_app/ui/helpers/theme/ui_helper.dart';
import 'package:verify_app/ui/widgets/vapp_button.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GoogleMapController mapController;

  Future<bool> _popCamera() {
    debugPrint("_popCamera");
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Leaving camera forever'),
              content: Text('Are you S-U-R-E, S-I-R?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('no'),
                  onPressed: Navigator.of(context).pop,
                ),
                FlatButton(
                  //yes button
                  child: Text('yes'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
        barrierDismissible: true);

    return Future.value(false);
  }

  Widget closeBY(Position position, ScrollController controller) {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Center(
            child: Text('location not available'),
          );
        } else if (projectSnap.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            shrinkWrap: true,
            controller: controller,
            itemCount: projectSnap.data.length,
            itemBuilder: (context, index) {
              Placemark place = projectSnap.data[index];
              return ListTile(
                onTap: () {},
                contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
                leading: Container(
                  height: 40.0,
                  width: 40.0,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
                title: Text(place.locality),
                subtitle: Text(place.country),
              );
            });
      },
      future: Geolocator()
          .placemarkFromCoordinates(position.latitude, position.longitude),
    );
  }

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Position>(context);
    return FutureBuilder<GeolocationStatus>(
        future: Geolocator().checkGeolocationPermissionStatus(),
        builder:
            (BuildContext context, AsyncSnapshot<GeolocationStatus> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.data == GeolocationStatus.denied) {
            return Text(
                'Location services disabledEnable location services for this App using the device settings.');
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Location',
                style: TextStyle(fontSize: 15.0),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.notifications_none),
                  onPressed: () {},
                ),
                SizedBox(
                  width: UIhelper.kPaddingS,
                ),
                IconButton(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  icon: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/chefavatar2.jpg'),
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: UIhelper.kPaddingM,
                ),
              ],
            ),
            body: SafeArea(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.3),
                    child: GoogleMap(
                      mapType: MapType.normal,
                      circles: Set.from([
                        Circle(
                            circleId: CircleId("myPostition"),
                            center: LatLng(model.latitude, model.longitude),
                            radius: 400,
                            strokeColor: Colors.blue,
                            strokeWidth: 5,
                            fillColor: Colors.blue.withOpacity(0.2))
                      ]),
                      onMapCreated: (controller) {
                        mapController = controller;
                      },
                      initialCameraPosition: CameraPosition(
                        target: LatLng(model.latitude, model.longitude),
                        zoom: 15.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Material(
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Step 2',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                  DraggableScrollableSheet(
                    minChildSize: 0.4,
                    builder: (context, controller) => Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 16.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 40.0,
                                  width: 40.0,
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor),
                                ),
                                SizedBox(
                                  width: UIhelper.kPaddingS,
                                ),
                                Text(
                                  'Share live location',
                                  style: Theme.of(context).textTheme.bodyText1,
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Expanded(
                            child: Material(child: closeBY(model, controller)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: VerifyAppButton(
                              title: "Verify",
                              onPressed: () {},
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
