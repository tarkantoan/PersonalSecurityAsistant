import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:personal_security_asistant/core/cRouter.class.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.controller.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.view.dart';
import 'package:personal_security_asistant/views/screens/home/widgets/home_main_widget.dart';

class HomeMapsWidget extends StatefulWidget {
  HomeMapsWidget({Key? key, required this.parent}) : super(key: key);
  HomeAppsState parent;
  GoogleMapController? mapController;

  @override
  _HomeMapsWidgetState createState() => _HomeMapsWidgetState();
}

CameraPosition? cameraPosition;

class _HomeMapsWidgetState extends State<HomeMapsWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://cdn.discordapp.com/attachments/941760150950273055/942000869996634122/1447419287677.png')),
        ),
        child: FutureBuilder(
          builder: (bcontext, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Position pos = (snapshot.data as Position);
              cameraPosition = CameraPosition(
                  bearing: pos.heading,
                  target: LatLng(pos.latitude, pos.longitude),
                  zoom: 17);
              return GestureDetector(
                onTap: () {},
                child: GoogleMap(
                  trafficEnabled: false,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  mapType: MapType.normal,
                  initialCameraPosition: cameraPosition!,
                  onMapCreated: (GoogleMapController controller) {
                    widget.mapController = controller;
                  },
                  onTap: (s) {
                    CarCrashController s = CarCrashController();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) => CarCrashScreen(controller: s)));
                  },
                ),
              );
            }
            return Text("");
          },
          future: Geolocator.getCurrentPosition(),
        ),
      ),
    );
  }
}
