import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Donors_screen extends StatefulWidget {
  const Donors_screen({Key? key}) : super(key: key);

  @override
  State<Donors_screen> createState() => _Donors_screenState();
}

class _Donors_screenState extends State<Donors_screen> {
  String name = '';
  void getData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection('Users').doc(user?.uid).get();
    print(vari);
  }

  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(title: Text('Donors')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (BuildContext context, snapshot) {
          return !snapshot.hasData
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    QueryDocumentSnapshot? data = snapshot.data?.docs[index];
                    return ListTile(
                      title: Text(data!['email'].toString(), style: TextStyle(color: Colors.red)),
                    );
                  },
                );
        },
      ),
    );
  }
}
