import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePageDesign extends StatefulWidget {
  @override
  _ProfilePageDesignState createState() => _ProfilePageDesignState();
}

class _ProfilePageDesignState extends State<ProfilePageDesign> {
  FirebaseAuth auth = FirebaseAuth.instance;
  Map<String, dynamic>? data;
  String? userName;
  String? userEmail;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('User')
          .where("userId", isEqualTo: auth.currentUser!.uid)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return Column(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            data = document.data()! as Map<String, dynamic>;
            return profileLayout(
                data!['userName'], data!['userEmail'], data!['userAddress']);
          }).toList(),
        );
      },
    );
  }
}

Widget profileLayout(username, email, address) {
  return Container(
    child: Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                'https://pub-static.fotor.com/assets/projects/pages/d5bdd0513a0740a8a38752dbc32586d0/fotor-03d1a91a0cec4542927f53c87e0599f6.jpg',
                width: SizeConfig.screenWidth * 0.45,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Text(username),
        Text(email),
        Text(address)
      ],
    ),
  );
}
