import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/LabReports/ShowReport.dart';

class LabReports extends StatefulWidget {
  String docID;
  LabReports({this.docID});
  @override
  _LabReportsState createState() => _LabReportsState();
}

class _LabReportsState extends State<LabReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Lab Reports",
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
              .doc(widget.docID)
              .snapshots(),
          builder: (context, snapshot) {
            List<String> name = [];
            List<String> date = [];
            List<String> reports = [];
              try {
                for (var dat in snapshot.data['LabReports']) {
                  reports.add(dat['Report']);
                  name.add(dat['Name']);
                  date.add(dat['Date']);
                }
              } catch (NoSuchMethodError) {
                print("DANGER");
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

              return (date == null || name == null)
                  ? Center(
                child: Text('No Reports Available'),
              )
                  : Builder(
                builder: (context) =>
                    Stack(
                      children: [
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                height:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .height / 1.25,
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  //itemCount: snapshot.data['LabReports'],
                                  itemCount: name.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          leading: CircleAvatar(
                                            radius: 30.0,
                                            backgroundColor:
                                            Colors.blueGrey[300],
                                            child: Icon(
                                              Icons.receipt_long_sharp,
                                              color: Colors.black,
                                              size: 50.0,
                                            ),
                                          ),
                                          title: Text(
                                            name[index],
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                          trailing: Text(date[index]),
                                          onTap: () {
                                            print("Tapped");
                                            Navigator.push(context,
                                                MaterialPageRoute(builder:
                                                    (BuildContext context) {
                                                  return ShowReport(
                                                    report: reports[index],
                                                    title: name[index],
                                                    date: date[index],
                                                    docID: widget.docID,
                                                  );
                                                }));
                                          },
                                        ),
                                        Divider(),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              // uploading
                              //     ? Center(
                              //
                              //   child: CircularProgressIndicator(),
                              //   // ],
                              //   // ),
                              // )
                              //     : Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
              );
            }
          ),
    );

  }
}
