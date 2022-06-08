import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../common/colors.dart';
import '../data/blood_request.dart';
import '../screens/single_request_screen.dart';
import '../utils/blood_types.dart';
import '../utils/tools.dart';

const kBorderRadius = 12.0;

class BloodRequestTile extends StatefulWidget {
  final BloodRequest? request;

  BloodRequestTile({Key? key, this.request}) : super(key: key);

  @override
  State<BloodRequestTile> createState() => _BloodRequestTileState();
}

class _BloodRequestTileState extends State<BloodRequestTile> {
  // // int long=int.parse(request!.medicalCenter.latitude);
  // late GoogleMapController mycontroller;
  // final Set<Marker> markers = new Set(); //markers for google map
  // late LatLng showLocation = LatLng(double.parse(widget.request!.medicalCenter.latitude.toString()), double.parse(widget.request!.medicalCenter.longitude.toString()));

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Column(
        children: [
          // Container(
          //   width: double.infinity,
          //   height: 200,
          //   color: Colors.red,
          //   child: GoogleMap(
          //     mapType: MapType.normal,
          //     // markers: '',
          //     initialCameraPosition: CameraPosition(
          //       target: LatLng(double.parse(widget.request!.medicalCenter.latitude.toString()), double.parse(widget.request!.medicalCenter.longitude.toString())),
          //       zoom: 14,
          //     ),
          //     markers: getmarkers(),

          //     onMapCreated: (GoogleMapController controller) {
          //       setState(() {
          //         mycontroller = controller;
          //       });
          //     },
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Patient Name', style: textTheme.caption),
                      Text(widget.request!.patientName ?? ''),
                      const SizedBox(height: 12),
                      Text('Location', style: textTheme.caption),
                      Text(
                        '${widget.request!.medicalCenter.name} - ${widget.request!.medicalCenter.location}',
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Needed By', style: textTheme.caption),
                    Text(Tools.formatDate(widget.request!.requestDate) ?? ''),
                    const SizedBox(height: 12),
                    Text('Blood Type', style: textTheme.caption),
                    Text(widget.request!.bloodType.name),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => SingleRequestScreen(request: widget.request),
              ));
            },
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(kBorderRadius),
              bottomLeft: Radius.circular(kBorderRadius),
            ),
            child: Ink(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: MainColors.primary,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(kBorderRadius),
                  bottomLeft: Radius.circular(kBorderRadius),
                ),
              ),
              child: Center(
                child: Text(
                  'Details',
                  style: textTheme.button!.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Set<Marker> getmarkers() {
  //   //markers to place on map
  //   setState(() {
  //     markers.add(Marker(
  //       //add first marker
  //       markerId: MarkerId(showLocation.toString()),
  //       position: LatLng(double.parse(widget.request!.medicalCenter.latitude.toString()), double.parse(widget.request!.medicalCenter.longitude.toString())), //position of marker
  //       infoWindow: InfoWindow(
  //         //popup info
  //         title:widget.request!.medicalCenter.name.toString(),
  //         snippet:widget.request!.medicalCenter.location.toString(),
  //       ),
  //       icon: BitmapDescriptor.defaultMarker, //Icon for Marker
  //     ));

  //     //add more markers here
  //   });

  //   return markers;
  // }
}
