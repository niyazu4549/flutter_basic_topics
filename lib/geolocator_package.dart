import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorPackage extends StatefulWidget {
  const GeolocatorPackage({super.key});

  @override
  State<GeolocatorPackage> createState() => _GeolocatorPackageState();
}

class _GeolocatorPackageState extends State<GeolocatorPackage> {
  Position? position;
  double longitude= 0;
  double latitude= 0;
  bool isComplete= true;

  //Create a function to fetch location
  Future<Position> _determinePosition() async{
    bool serviceEnabled;
    LocationPermission permission;

    // Test if Location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      await Geolocator.checkPermission();
      return Future.error('Location services are disabled.');
    }
    permission= await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission= await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error('Location permission are denied');
      }
    }
    if(permission == LocationPermission.deniedForever){
      //permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanantly denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isComplete? const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.black,
          )
        ],
      ) : Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Latitude : $latitude",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Longitude : $longitude",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              isComplete= false;
            });
            _determinePosition().then((value){
              setState(() {
                longitude= value.longitude;
                latitude= value.latitude;
                isComplete= true;
              });
            });
          },
              child: const Text("Get Location"))
        ],
      ),
    );
  }
}
