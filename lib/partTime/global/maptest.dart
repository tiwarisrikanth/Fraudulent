import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = LatLng(45.343434, -122.545454);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;
  String _address = "";
  late BitmapDescriptor customMarker;

  @override
  void initState() {
    super.initState();
    _setCustomMarker();
    _getUserLocation();
  }

  void _setCustomMarker() async {
    customMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/custom_marker.png');
  }

  Future<void> _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    _moveCamera(LatLng(position.latitude, position.longitude));
  }

  void _moveCamera(LatLng position) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 16)));
    _updateAddress(position);
  }

  Future<void> _updateAddress(LatLng position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];

    setState(() {
      _address =
          "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
      _markers.clear();
      _markers.add(Marker(
        markerId: MarkerId('centerMarker'),
        position: position,
        icon: customMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onCameraIdle() {
    _updateAddress(_lastMapPosition);
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  Widget _customButton(IconData icon, Function function) {
    return FloatingActionButton(
      heroTag: icon.codePoint,
      onPressed: () => function(),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.white,
      child: Icon(
        icon,
        size: 16,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              mapToolbarEnabled: false,
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              initialCameraPosition:
                  CameraPosition(target: _center, zoom: 11.0),
              markers: _markers,
              mapType: _currentMapType,
              onCameraMove: _onCameraMove,
              onCameraIdle: _onCameraIdle,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    _customButton(Icons.map, _onMapTypeButtonPressed),
                    SizedBox(height: 15),
                    _customButton(Icons.my_location, _getUserLocation),
                  ],
                ),
              ),
            ),
            Center(
              child: Icon(
                Icons.location_on,
                size: 50,
                color: Colors.red,
              ),
            ),
            Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Text(
                  _address,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
