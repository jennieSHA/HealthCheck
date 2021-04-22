import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowReport extends StatelessWidget {
  ShowReport({this.report, this.title, this.date});

  String title;
  String report, date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width / 10,
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 35.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('User')
              .doc('jinishagehlot193')
              .snapshots(),
          builder: (context, snapshot) {
            String patientId;
            String age;
            String gender;
            try {
              patientId = snapshot.data['PatientId'];
              age = snapshot.data['Age'].toString();
              gender = snapshot.data['Gender'];
            } catch (NoSuchMethodError) {
              Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Fetching your reports...',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              );
            }
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(8.0),
                //height: MediaQuery.of(context).size.height / 1,

                child: Column(
                  children: [
                    Text(
                      'Patient Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Divider(
                      thickness: 4.0,
                      color: Colors.blueGrey[200],
                    ),
                    Text(
                      "Patient ID : " +
                          patientId +
                          "\n\n" +
                          "Age : " +
                          age +
                          "\n\n" +
                          "Gender : " +
                          gender +
                          "\n\n" +
                          "Report Date : " +
                          date +
                          "",
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    Divider(
                      thickness: 4.0,
                      color: Colors.blueGrey[200],
                    ),
                    Text(
                      'Report Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Text(
                      "\n" + report,
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
