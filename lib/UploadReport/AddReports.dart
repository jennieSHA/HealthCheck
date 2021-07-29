import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/UploadReport/ShowImage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddReport extends StatefulWidget {
  String docID;
  AddReport({this.docID});
  @override
  _AddReportState createState() => _AddReportState();
}

class _AddReportState extends State<AddReport> {
  File _image;
  Reference _ref;
  bool uploading = false;
  double val = 0;
  String imgURL;

  @override
  Widget build(BuildContext context) {
    Future uploadImg() async {
      print("**********" + _image.toString());
      _ref = FirebaseStorage.instance.ref().child(basename(_image.path));
      await _ref.putFile(_image).whenComplete(() async {
        await _ref.getDownloadURL().then((value) {
          // FirebaseFirestore.instance
          //     .collection('User')
          //     .doc('jinishagehlot193')
          //     .update({
          //   'imgURL': FieldValue.arrayUnion([value])
          // });
          imgURL = value;

          // setState(() {
          //   Scaffold.of(context).showSnackBar(SnackBar(content: Text('Report Successfully Uploaded')));
          // });
        });
      });
    }

    Future getImage() async {
      var image = await ImagePicker().getImage(source: ImageSource.camera);
      setState(() {
        if (image != null) {
          String name, date = DateFormat("yyyy-MM-dd").format(DateTime.now());
          _image = File(image.path);
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  contentPadding: const EdgeInsets.all(16.0),
                  content: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        new TextField(
                          keyboardType: TextInputType.name,
                          //controller: Salary..text = salary.toString(),
                          autofocus: true,
                          onChanged: (val) {
                            name = val;
                          },
                          decoration: new InputDecoration(
                            labelText: 'Enter name',
                            //hintText: 'eg. 700'
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 50,
                        ),
                        Text(
                          "Enter Date\n",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 4,
                          child: CupertinoDatePicker(
                            onDateTimeChanged: (val) {
                              String res = val.toString();
                              date = res.substring(0, 10);
                              print(date);
                            },
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: DateTime.now(),
                            maximumDate: DateTime.now(),
                            minimumYear: DateTime.now().year - 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blueGrey[300]),
                      child: Text(
                        'Upload report',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          uploading = true;
                        });
                        if (name == null) {
                          name = 'Untitled';
                        }
                        Navigator.pop(context);
                        uploadImg().whenComplete(() {
                          var values = {
                            'imgURL': imgURL,
                            'date': date,
                            'reportName': name
                          };
                          FirebaseFirestore.instance
                              .collection('User')
                              .doc(widget.docID)
                              .update({
                            'UploadedReport': FieldValue.arrayUnion([values])
                          });
                          setState(() {
                            uploading = false;
                          });
                        });

                        // FirebaseFirestore.instance
                        //     .collection('User')
                        //     .doc('jinishagehlot193')
                        //     .update({
                        //   'repoDate': FieldValue.arrayUnion([date])
                        // });

                        // FirebaseFirestore.instance
                        //     .collection('User')
                        //     .doc('jinishagehlot193')
                        //     .update({
                        //   'repoName': FieldValue.arrayUnion([name])
                        // });
                      },
                    ),
                  ],
                );
              });
        } else {
          print("no image selected");
        }
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Reports",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width / 10,
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
              size: 35.0,
            ),
            onPressed: () {
              getImage();
            },
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
            List<String> images = [];
            List<String> name = [];
            List<String> date = [];
            try {
              for (var dat in snapshot.data['UploadedReport']) {
                images.add(dat['imgURL']);
                name.add(dat['reportName']);
                date.add(dat['date']);
              }
            } catch (NoSuchMethodError) {
              print("DANGER AG");
              print(snapshot.data['UploadedReport']);
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

            return images == []
                ? Center(
                    child: Text('No Reports Available' ,style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),),
                  )
                : Builder(
                    builder: (context) => Stack(
                      children: [
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                height:
                                    MediaQuery.of(context).size.height / 1.25,
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: images.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          leading: CircleAvatar(
                                            radius: 30.0,
                                            backgroundImage:
                                                NetworkImage(images[index]),
                                          ),
                                          title: Text(
                                            name[index],
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                          trailing: Text(date[index]),
                                          onTap: () {
                                            print("Tapped");
                                            Navigator.push(context,
                                                MaterialPageRoute(builder:
                                                    (BuildContext context) {
                                              return ShowImage(
                                                image: images[index],
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
                              uploading
                                  ? Center(
                                      // child: Column(
                                      //   children: <Widget>[
                                      //     Container(
                                      //       child: Text(
                                      //         'uploading...',
                                      //             style: TextStyle(fontSize: 20),
                                      //       ),
                                      //     ),
                                      //     SizedBox(height: MediaQuery.of(context).size.height / 50,),
                                      child: CircularProgressIndicator(
                                          //  value: val,valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
                                          ),
                                      // ],
                                      // ),
                                    )
                                  : Container(),

                              // Expanded(
                              // child: Align(
                              //   alignment: Alignment .bottomCenter,
                              //   child: Container(
                              //     width: MediaQuery.of(context).size.width,
                              //     height: MediaQuery.of(context).size.height / 15,
                              //     child: TextButton(
                              //      style: TextButton.styleFrom(backgroundColor: Colors.lightGreen),
                              //       child: Text('Submit', style: TextStyle(color: Colors.black,),),
                              //       onPressed: (){
                              //         uploadImg().whenComplete(() => (print("COMPLETED")));
                              //       },
                              //      ),
                              //   ),
                              // ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          }),
    );
  }
}
