import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/src/widgets/maincardcontainer.dart';
import 'package:taxi_app/src/widgets/utilities/drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late final GoogleMapController googleMapController;
  double bottomPadding = 0;

  final Completer<GoogleMapController> _controller = Completer();
  late final Position currentPosition;
  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentPosition = position;
    LatLng latLngPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition, zoom: 14);
    googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Container(
        color: Colors.white,
        width: 255,
        child: const Drawers(),
      ),
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: bottomPadding),
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                _controller.complete(controller);
                locatePosition();
                googleMapController = controller;
                bottomPadding = 253.0;
              });
            },
          ),
          Positioned(
            top: 45,
            left: 22,
            child: _DrawerDesign(scaffoldKey: scaffoldKey),
          ),
          const Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: CardContainerMain(),
          ),
        ],
      ),
    );
  }
}

class _DrawerDesign extends StatelessWidget {
  const _DrawerDesign({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => scaffoldKey.currentState!.openDrawer(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: const [
            BoxShadow(
                color: Colors.black,
                blurRadius: 6.0,
                spreadRadius: 0.5,
                offset: Offset(0.7, 0.7)),
          ],
        ),
        child: const CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          radius: 20,
        ),
      ),
    );
  }
}
