import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map/widgets/constants.dart';


class PolygoneScreen extends StatefulWidget {
  const PolygoneScreen({Key? key}) : super(key: key);

  @override
  _PolygoneScreenState createState() => _PolygoneScreenState();
}

class _PolygoneScreenState extends State<PolygoneScreen> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(8.984744630984105, -79.51568584889174),
    zoom: 14,
  );
  final Set<Marker> _markers = {};
  Set<Polygon> _polygone = HashSet<Polygon>();
  final polygons = <Polygon>[];

  List<LatLng> _mark = [];
  List<LatLng> points = [
    LatLng(9.000471, -79.495544),
    LatLng(8.999406, -79.495831),
    LatLng(8.998838, -79.494680),
  ];

  void _setPolygone() {
    _polygone.add(Polygon(
      polygonId: PolygonId('1'),
      points: _mark,
      strokeColor: Colors.deepOrange,
      strokeWidth: 1,
      fillColor: Colors.deepOrange.withOpacity(0.1),
      geodesic: false,
    ));
  }

  void _onMapTap(LatLng tappedPoint) {
    setState(() {
      _mark.add(LatLng(tappedPoint.latitude, tappedPoint.longitude));
    });
    _setPolygone();
    print(_mark);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _setPolygone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Polygone'),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: _setPolygone,
        // ignore: sort_child_properties_last
        child: const Icon(Icons.check),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: const BorderSide(color: Constants.secondaryColor, width: 3.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        myLocationButtonEnabled: true,
        myLocationEnabled: false,
        onTap: _onMapTap,
        // cameraTargetBounds: CameraTargetBounds(LatLngBounds(
        //   northeast: LatLng(9.006808, -79.508148),
        //   southwest:  LatLng(9.003121, -79.505702),
        // )),
        //  onCameraMove: ((_position) => _updatePosition(_position)),
        markers: _markers,
        polygons: Set.from(_polygone),

        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
