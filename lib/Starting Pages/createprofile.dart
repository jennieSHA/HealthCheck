import 'package:flutter_app/Starting Pages/MainHomepage.dart';
import 'package:flutter_app/Starting Pages/profilepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//import 'main.dart';
//import 'main.dart';
class CreateProfile extends StatefulWidget {
  String docID;
  CreateProfile({this.docID});
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Create Profile"),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        padding: EdgeInsets.all(40.0),
        color: Colors.blueGrey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: Name,
                  decoration: InputDecoration(
                      hintText: "Name"
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: Gender,
                  decoration: InputDecoration(
                      hintText: "Gender"
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: Bloodgroup,
                  decoration: InputDecoration(
                      hintText: "Bloodgroup"
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: EmailID,
                  decoration: InputDecoration(
                      hintText: "Email-ID"
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: DateofBirth,
                  decoration: InputDecoration(
                      hintText: "Date-of-Birth"
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: Maritalstatus,
                  decoration: InputDecoration(
                      hintText: "Marital-status"
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: Height,
                  decoration: InputDecoration(
                      hintText: "Height"
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: Weight,
                  decoration: InputDecoration(
                      hintText: "Weight"
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),

                FlatButton(onPressed:() {
                  var values = {
                    'imgURL': "https://firebasestorage.googleapis.com/v0/b/health-checkup-70b2c.appspot.com/o/390b9534-ef99-40f2-8490-eee6347a585a581214048507588892.jpg?alt=media&token=dfbd4409-1533-4bc2-9293-034bf50eedfa",
                    'date': "yyyy-mm-dd",
                    'reportName': "report name",
                  };


                  Map <String,dynamic> data = {
                       'UploadedReport': FieldValue.arrayUnion([values]),
                       "Name":Name.text,"Gender":Gender.text,
                    "Bloodgroup":Bloodgroup.text,"EmailID":EmailID.text,"DateofBirth":DateofBirth.text,
                    "Maritalstatus":Maritalstatus.text,"Height":Height.text,"Weight":Weight.text,
                   };
                  final DocumentReference docref =  FirebaseFirestore.instance.collection("User").doc(widget.docID);
                  docref.set(data, SetOptions(merge: true));

                  Navigator.push(context, MaterialPageRoute(builder: (context){return Home(docID: widget.docID,);}));
                }, child: Text("Submit")
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}


// class CreateProfile extends StatelessWidget {
//
//   TextEditingController Name = new TextEditingController();
//   TextEditingController Gender = new TextEditingController();
//   TextEditingController Bloodgroup = new TextEditingController();
//   TextEditingController EmailID = new TextEditingController();
//   TextEditingController DateofBirth = new TextEditingController();
//   TextEditingController Maritalstatus = new TextEditingController();
//   TextEditingController Height = new TextEditingController();
//   TextEditingController Weight = new TextEditingController();
//
//   String docID;
//   CreateProfile({docID});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: Text("Create Profile"),
//         backgroundColor: Colors.grey,
//       ),
//       body: Container(
//         padding: EdgeInsets.all(40.0),
//         color: Colors.blueGrey,
//         child: Center(
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: Name,
//                 decoration: InputDecoration(
//                     hintText: "Name"
//                 ),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               TextFormField(
//                 controller: Gender,
//                 decoration: InputDecoration(
//                     hintText: "Gender"
//                 ),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               TextFormField(
//                 controller: Bloodgroup,
//                 decoration: InputDecoration(
//                     hintText: "Bloodgroup"
//                 ),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               TextFormField(
//                 controller: EmailID,
//                 decoration: InputDecoration(
//                     hintText: "Email-ID"
//                 ),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               TextFormField(
//                 controller: DateofBirth,
//                 decoration: InputDecoration(
//                     hintText: "Date-of-Birth"
//                 ),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               TextFormField(
//                 controller: Maritalstatus,
//                 decoration: InputDecoration(
//                     hintText: "Marital-status"
//                 ),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               TextFormField(
//                 controller: Height,
//                 decoration: InputDecoration(
//                     hintText: "Height"
//                 ),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               TextFormField(
//                 controller: Weight,
//                 decoration: InputDecoration(
//                     hintText: "Weight"
//                 ),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//
//               FlatButton(onPressed:() {
//                 print("#######" +docID);
//                 Map <String,dynamic> data = {"Name":Name.text,"Gender":Gender.text,
//                   "Bloodgroup":Bloodgroup.text,"EmailID":EmailID.text,"DateofBirth":DateofBirth.text,
//                   "Maritalstatus":Maritalstatus.text,"Height":Height.text,"Weight":Weight.text};
//                 final DocumentReference docref =  FirebaseFirestore.instance.collection('User').doc(docID);
//                 docref.set(data, SetOptions(merge: true));
//
//                 Navigator.push(context, MaterialPageRoute(builder: (context){return Home(docID: docID,);}));
//               }, child: Text("Submit")
//               ),
//             ],
//           ),
//         ),
//       ),
//
//     );
//   }
// }
