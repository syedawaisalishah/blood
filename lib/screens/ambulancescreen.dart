import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class AmbulanceScreen extends StatefulWidget {
  const AmbulanceScreen({Key? key}) : super(key: key);

  @override
  State<AmbulanceScreen> createState() => _AmbulanceScreenState();
}

class _AmbulanceScreenState extends State<AmbulanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ambulance Number')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Eidi Embulance'),
            trailing: IconButton(
              color: Colors.blue,
              onPressed: () async {
                final contact = 'tel:1122';
                if (await canLaunchUrl(Uri.parse(contact))) {
                  launchUrl(Uri.parse(contact));
                } else {
                  Fluttertoast.showToast(msg: 'Something wrong happened');
                }
              },
              icon: Icon(Icons.call),
            ),
          ),
          ListTile(
            title: Text('Chepa Embulance'),
            trailing: IconButton(
              color: Colors.blue,
              onPressed: () async {
                final contact = 'tel:1020';
                if (await canLaunchUrl(Uri.parse(contact))) {
                  launchUrl(Uri.parse(contact));
                } else {
                  Fluttertoast.showToast(msg: 'Something wrong happened');
                }
              },
              icon: Icon(Icons.call),
            ),
          ),
        ],
      ),
    );
  }
}
