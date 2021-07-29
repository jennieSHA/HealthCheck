import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadReport extends StatefulWidget {
  @override
  _UploadReportState createState() => _UploadReportState();
}

class _UploadReportState extends State<UploadReport> {
  String date, username, report, reponame;
  TextEditingController reportFieldText = TextEditingController();
  TextEditingController usernameFieldText = TextEditingController();
  TextEditingController reponameFieldText = TextEditingController();

  void clearText() {
    reportFieldText.clear();
    usernameFieldText.clear();
    reponameFieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pathology Interface'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
          ),
          ListTile(
            title: Text('Report Details'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
            child: TextField(
              controller: reportFieldText,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter report details',
                  fillColor: Colors.black),
              onChanged: (val) {
                report = val;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
          ),
          ListTile(
            title: Text('Username and Report Name'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
            child: TextFormField(
              controller: usernameFieldText,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter username',
              ),
              onChanged: (val) {
                username = val;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
            child: TextFormField(
              controller: reponameFieldText,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter report name',
              ),
              onChanged: (val) {
                reponame = val;
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 90,
          ),
          ListTile(
            title: Text('Enter date'),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 4,
            child: CupertinoDatePicker(
              onDateTimeChanged: (val) {
                String res = val.toString();
                date = res.substring(0, 10);
              },
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              maximumDate: DateTime.now(),
              minimumYear: DateTime.now().year - 20,
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: () {
                  print(date + "  " + username + "  " + report);
                  var values = {
                    'Name': reponame,
                    'Report': report,
                    'Date': date
                  };
                  FirebaseFirestore.instance
                      .collection('User')
                      .doc(username)
                      .update({
                    'LabReports': FieldValue.arrayUnion([values])
                  });
                  clearText();
                },
                child: const Text('Send',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                color: Colors.black45,
                elevation: 5,
              ))
        ],
      ),
    );
  }
}