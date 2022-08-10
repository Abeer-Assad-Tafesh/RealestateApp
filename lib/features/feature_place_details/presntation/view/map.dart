import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MapScreen());
}

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  // 2- Initialize a variable to specify initial camera position
  static const _initialCameraPosition = CameraPosition(
      target: LatLng(31.9522, 35.2332),
      zoom: 11.5  // max = 21
  );

  // 4- Create GoogleMapController for fab to focus the camera on the location
  GoogleMapController? _googleMapController;


  //5- Don't forget to dispose it
  @override
  void dispose() {
    // TODO: implement dispose
    _googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1- We'll going to use GoogleMap widget
      body: Stack(
          alignment: Alignment.center,
          children: [
            GoogleMap(
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              // 3- Using the variable being initialized
              initialCameraPosition: _initialCameraPosition,
              // 6- Using the controller
              onMapCreated: (controller) => _googleMapController = controller,
            ),
          ]),
      // 7- Make fab to zoom to the destination
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController?.animateCamera(
            CameraUpdate.newCameraPosition(_initialCameraPosition)),
        child: const Icon(Icons.center_focus_strong ),
      ),

    );
  }

}




