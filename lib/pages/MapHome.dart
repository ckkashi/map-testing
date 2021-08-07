import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapHome extends StatefulWidget {
  static const LatLng _initialCamPosition = LatLng(29.75326878120253, 68.67840074999995) ;

  @override
  _MapHomeState createState() => _MapHomeState();
}

class _MapHomeState extends State<MapHome> {
  GoogleMapController? _controller;
  // ignore: unused_field
  Location _location = Location() ;

  void _onMapCreated(GoogleMapController controller){
    _controller = controller;
    _location.onLocationChanged.listen((locate) { 
      double? lat;
      double? lng;
      lat = locate.latitude;
      lng = locate.longitude;
      _controller!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(lat!,lng!),zoom: 15),
          ),
      );
    });

  }

  @override
  Widget build(BuildContext context) {

    void refresh(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MapHome()));
    }

    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        title: Text('Map Testing'),
        centerTitle: false,
        actions: [
          IconButton(onPressed: refresh, icon: Icon(Icons.refresh)),
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.person)),
        ],
      ),
      body: Container(
        width: 100.w,
        height: 100.h,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: 100.w,
                height: 100.h,
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: CameraPosition(target: MapHome._initialCamPosition),
                  onMapCreated: _onMapCreated,
                  myLocationEnabled: true,
                ),
              )
              ),
          ],
        ),
      ),
    )
    );
  }
}