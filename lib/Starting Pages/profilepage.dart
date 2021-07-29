

import 'package:flutter_app/Starting Pages/registeruser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  String docID;
  ProfileScreen({this.docID});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController Name = new TextEditingController();
  TextEditingController Gender = new TextEditingController();
  TextEditingController Bloodgroup = new TextEditingController();
  TextEditingController EmailID = new TextEditingController();
  TextEditingController DateofBirth = new TextEditingController();
  TextEditingController Maritalstatus = new TextEditingController();
  TextEditingController Height = new TextEditingController();
  TextEditingController Weight = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.grey,
      ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('User').snapshots(),
         builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot)
        {
          if(snapshot.hasData){
            //print("WE ARE IN PROFILE PAGE"+widget.docID);
            return ListView(
                children: snapshot.data.docs.map((e) =>
                    Column(
                        children:[
                          Padding(padding: EdgeInsets.all(5.0)),
                          Row(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0,)),
                                IconButton(icon: Icon(Icons.edit), onPressed: (){
                                  showDialog(context: context, builder: (context) => Dialog(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children :<Widget>[
                                        Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 5.0,0.0)),
                                        TextFormField(

                                            controller: Name),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        FlatButton(
                                          color: Colors.grey,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                          child:
                                          Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text("Update",maxLines: 50,),
                                          ),
                                          onPressed: (){
                                            FirebaseFirestore.instance.collection('User').doc(widget.docID).
                                            update({
                                              'Name':Name.text,
                                            }).whenComplete(() => Navigator.pop(context));
                                          },
                                        )
                                      ],
                                    ),
                                  ));
                                }),
                                Text(e["Name"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
                              ]
                          ),
                          Divider(),
                          Padding(padding: EdgeInsets.all(5.0)),
                          Row(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0,)),
                                IconButton(icon: Icon(Icons.edit), onPressed: (){
                                  showDialog(context: context, builder: (context) => Dialog(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children :<Widget>[
                                        Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 5.0,0.0)),
                                        TextFormField(

                                            controller: Gender),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        FlatButton(
                                          color: Colors.grey,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                          child:
                                          Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text("Update",maxLines: 50,),
                                          ),
                                          onPressed: (){
                                            FirebaseFirestore.instance.collection('User').doc(widget.docID).
                                            update({
                                              "Gender":Gender.text,
                                            }).whenComplete(() => Navigator.pop(context));
                                          },
                                        )
                                      ],
                                    ),
                                  ));
                                }),
                                Text(e["Gender"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
                              ]
                          ),
                          // Divider(),
                          // Padding(padding: EdgeInsets.all(5.0)),
                          // Row(
                          //     children: <Widget>[
                          //       Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0,)),
                          //       IconButton(icon: Icon(Icons.edit), onPressed: (){
                          //         showDialog(context: context, builder: (context) => Dialog(
                          //           child: Column(
                          //             mainAxisSize: MainAxisSize.min,
                          //             children :<Widget>[
                          //               Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 5.0,0.0)),
                          //               TextFormField(
                          //
                          //                   controller: Bloodgroup),
                          //               SizedBox(
                          //                 height: 20,
                          //               ),
                          //               FlatButton(
                          //                 color: Colors.grey,
                          //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          //                 child:
                          //                 Padding(
                          //                   padding: EdgeInsets.all(10.0),
                          //                   child: Text("Update",maxLines: 50,),
                          //                 ),
                          //                 onPressed: (){
                          //                   FirebaseFirestore.instance.collection('Patient Form').doc('tanaya@gmail.com').
                          //                   update({
                          //                     "Bloodgroup":Bloodgroup.text,
                          //                   }).whenComplete(() => Navigator.pop(context));
                          //                 },
                          //               )
                          //             ],
                          //           ),
                          //         ));}),
                          //       Text(e["Bloodgroup"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
                          //     ]
                          // ),
                          // Divider(),
                          // Padding(padding: EdgeInsets.all(5.0)),
                          // Row(
                          //     children: <Widget>[
                          //       Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0,)),
                          //       IconButton(icon: Icon(Icons.edit), onPressed: (){
                          //         showDialog(context: context, builder: (context) => Dialog(
                          //           child: Column(
                          //             mainAxisSize: MainAxisSize.min,
                          //             children :<Widget>[
                          //               Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 5.0,0.0)),
                          //               TextFormField(
                          //
                          //                   controller: EmailID),
                          //               SizedBox(
                          //                 height: 20,
                          //               ),
                          //               FlatButton(
                          //                 color: Colors.grey,
                          //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          //                 child:
                          //                 Padding(
                          //                   padding: EdgeInsets.all(10.0),
                          //                   child: Text("Update",maxLines: 50,),
                          //                 ),
                          //                 onPressed: (){
                          //                   FirebaseFirestore.instance.collection('Patient Form').doc('tanaya@gmail.com').
                          //                   update({
                          //                     "EmailID":EmailID.text,
                          //                   }).whenComplete(() => Navigator.pop(context));
                          //                 },
                          //               )
                          //             ],
                          //           ),
                          //         ));
                          //       }),
                          //       Text(e["EmailID"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
                          //     ]
                          // ),
                          // Divider(),
                          // Padding(padding: EdgeInsets.all(5.0)),
                          // Row(
                          //     children: <Widget>[
                          //       Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0,)),
                          //       IconButton(icon: Icon(Icons.edit), onPressed: (){
                          //         showDialog(context: context, builder: (context) => Dialog(
                          //           child: Column(
                          //             mainAxisSize: MainAxisSize.min,
                          //             children :<Widget>[
                          //               Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 5.0,0.0)),
                          //               TextFormField(
                          //
                          //                   controller: DateofBirth),
                          //               SizedBox(
                          //                 height: 20,
                          //               ),
                          //               FlatButton(
                          //                 color: Colors.grey,
                          //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          //                 child:
                          //                 Padding(
                          //                   padding: EdgeInsets.all(10.0),
                          //                   child: Text("Update",maxLines: 50,),
                          //                 ),
                          //                 onPressed: (){
                          //                   FirebaseFirestore.instance.collection('Patient Form').doc('tanaya@gmail.com').
                          //                   update({
                          //                     "DateofBirth":DateofBirth.text,
                          //                   }).whenComplete(() => Navigator.pop(context));
                          //                 },
                          //               )
                          //             ],
                          //           ),
                          //         ));
                          //       }),
                          //       Text(e["DateofBirth"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
                          //     ]
                          // ),
                          // Divider(),
                          // Padding(padding: EdgeInsets.all(5.0)),
                          // Row(
                          //     children: <Widget>[
                          //       Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0,)),
                          //       IconButton(icon: Icon(Icons.edit), onPressed: (){
                          //         showDialog(context: context, builder: (context) => Dialog(
                          //           child: Column(
                          //             mainAxisSize: MainAxisSize.min,
                          //             children :<Widget>[
                          //               Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 5.0,0.0)),
                          //               TextFormField(
                          //
                          //                   controller: Maritalstatus),
                          //               SizedBox(
                          //                 height: 20,
                          //               ),
                          //               FlatButton(
                          //                 color: Colors.grey,
                          //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          //                 child:
                          //                 Padding(
                          //                   padding: EdgeInsets.all(10.0),
                          //                   child: Text("Update",maxLines: 50,),
                          //                 ),
                          //                 onPressed: (){
                          //                   FirebaseFirestore.instance.collection('Patient Form').doc('tanaya@gmail.com').
                          //                   update({
                          //                     "Maritalstatus":Maritalstatus.text,
                          //                   }).whenComplete(() => Navigator.pop(context));
                          //                 },
                          //               )
                          //             ],
                          //           ),
                          //         ));
                          //       }),
                          //       Text(e["Maritalstatus"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
                          //     ]
                          // ),
                          // Divider(),
                          // Padding(padding: EdgeInsets.all(5.0)),
                          // Row(
                          //     children: <Widget>[
                          //       Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0,)),
                          //       IconButton(icon: Icon(Icons.edit), onPressed: (){
                          //         showDialog(context: context, builder: (context) => Dialog(
                          //           child: Column(
                          //             mainAxisSize: MainAxisSize.min,
                          //             children :<Widget>[
                          //               Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 5.0,0.0)),
                          //               TextFormField(
                          //
                          //                   controller: Height),
                          //               SizedBox(
                          //                 height: 20,
                          //               ),
                          //               FlatButton(
                          //                 color: Colors.grey,
                          //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          //                 child:
                          //                 Padding(
                          //                   padding: EdgeInsets.all(10.0),
                          //                   child: Text("Update",maxLines: 50,),
                          //                 ),
                          //                 onPressed: (){
                          //                   FirebaseFirestore.instance.collection('Patient Form').doc('tanaya@gmail.com').
                          //                   update({
                          //                     "Height":Height.text,
                          //                   }).whenComplete(() => Navigator.pop(context));
                          //                 },
                          //               )
                          //             ],
                          //           ),
                          //         ));
                          //       }),
                          //       Text(e["Height"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
                          //     ]
                          // ),
                          // Divider(),
                          // Padding(padding: EdgeInsets.all(5.0)),
                          // Row(
                          //     children: <Widget>[
                          //       Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0,)),
                          //       IconButton(icon: Icon(Icons.edit), onPressed: (){
                          //         showDialog(context: context, builder: (context) => Dialog(
                          //           child: Column(
                          //             mainAxisSize: MainAxisSize.min,
                          //             children :<Widget>[
                          //               Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 5.0,0.0)),
                          //               TextFormField(
                          //
                          //                   controller: Weight),
                          //               SizedBox(
                          //                 height: 20,
                          //               ),
                          //               FlatButton(
                          //                 color: Colors.grey,
                          //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          //                 child:
                          //                 Padding(
                          //                   padding: EdgeInsets.all(10.0),
                          //                   child: Text("Update",maxLines: 50,),
                          //                 ),
                          //                 onPressed: (){
                          //                   FirebaseFirestore.instance.collection('User').doc(docID).
                          //                   update({
                          //                     "Weight":Weight.text,
                          //                   }).whenComplete(() => Navigator.pop(context));
                          //                 },
                          //               )
                          //             ],
                          //           ),
                          //         ));
                          //
                          //       }),
                          //       Text(e["Weight"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
                          //     ]
                          // ),

                        ]
                    )).toList()
            );
          }
          return CircularProgressIndicator();
        },
      ),
      persistentFooterButtons:  <Widget>[
        IconButton(icon: Icon(Icons.account_circle_outlined), onPressed: ()async{
          FirebaseFirestore.instance.collection('User').doc(
              widget.docID).delete();
          Navigator.push(context, MaterialPageRoute(builder: (context){return RegistrationScreen();}));
        }),
        Text("sign out")
      ],
    );
  }
}


