
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location_geocoder/location_geocoder.dart';
class Convert_Lat_Long extends StatefulWidget {
  const Convert_Lat_Long({Key? key}) : super(key: key);
  @override
  _Convert_Lat_LongState createState() => _Convert_Lat_LongState();
}

class _Convert_Lat_LongState extends State<Convert_Lat_Long> {
// on below line we have created controllers for accessing values from textfield
  TextEditingController latitudeController = new TextEditingController();
  TextEditingController longitudeController = new TextEditingController();
 var _apiKey="AIzaSyDWG9dBx0eJVjzoxMKnA3NRjH9ZVYyItaQ";

// variable created to store the address
  String stAddress = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
// on below line we have given title of App
        title: Text('Google Map Current Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Get Address from Coordinates',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(height: 10),
// textfield1 for taking input as latitude
              TextField(
                controller: latitudeController,
                decoration: InputDecoration(
// Given Hint Text
                    hintText: 'Latitude',
                    border: OutlineInputBorder(
// Given border to textfield
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(height: 10),
// textfield2 for taking input as longitude
              TextField(
                controller: longitudeController,
                decoration: InputDecoration(
// Given hint text
                    hintText: 'Longitude',
                    border: OutlineInputBorder(
// given border to textfield
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(height: 10),
// Given padding to the Container
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Center(
                    child: Text(stAddress),
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  // stored the value of latitude in lat from textfield
//                   String lat = "9.967052689558441" ;
// // stored the value of longitude in lon from textfield
//                   String lon = "76.28557439329825";
// // converted the lat from string to double
//                   double lat_data = double.parse(lat);
// // converted the lon from string to double
//                   double lon_data = double.parse(lon);
// // Passed the coordinates of latitude and longitude
//                  // final coordinates = placemarkFromCoordinates(lat_data, lon_data);
//                  // final coordinates=
                  final LocatitonGeocoder geocoder = LocatitonGeocoder(_apiKey);
                  final address = await geocoder
                      .findAddressesFromCoordinates(Coordinates(9.9312, 76.2673));
                  print(address.first.addressLine);
                 // print(address.first.addressLine);
                  // var address = await Geocoder.local
                  //     .findAddressesFromCoordinates(coordinates);
                  var first = address.first;
// on below line we have set the address to string
                  setState(() {
                    stAddress = first.addressLine.toString();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
// specified color for button
                      color: Colors.blue,
                    ),
// given height for button
                    height: 50,
                    child: Center(
// on below line we have given button name
                      child: Text(
                        'Convert',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
