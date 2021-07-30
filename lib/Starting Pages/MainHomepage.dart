import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/DoctorAppointment/SpecialistList.dart';
import 'package:flutter_app/LabInterface/UploadReport.dart';
import 'package:flutter_app/LabReports/LabReports.dart';
import 'package:flutter_app/LabReports/PathologyInfo.dart';
import 'package:flutter_app/SelfAssesment/BodyParts.dart';
import 'package:flutter_app/Starting Pages/profilepage.dart';
import 'package:flutter_app/Starting%20Pages/registeruser.dart';
import 'package:flutter_app/UploadReport/AddReports.dart';
import 'package:flutter_app/DoctorBot/chat.dart';
import 'package:flutter_app/DoctorBot/Home.dart';


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.grey,
//       ),
//       home: Home(),
//     );
//   }
//}

class Home extends StatefulWidget {
  String docID;
  Home({this.docID});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List names = ["SELF ASSESMENT", "DOCTORS(booking)", "PHARMACY"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('HealthMate'),backgroundColor: Colors.black26,
      ),
      
      
        //FOOTER
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
                return Chat();
              }));
        },
        backgroundColor: Colors.black26,
        elevation: 2.0,
        child: Material(
          color: Colors.black26,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.00),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.0,
            ),
          ),
          child: Container(
            height: 90.0,
            width: 90.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Doctor',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Bot',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

            bottomNavigationBar: BottomAppBar(
    color: Colors.black26,
              shape: CircularNotchedRectangle(),
              notchMargin: 10,
              child: Container(
                height: 60,
                child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                    Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(right: 46),),

                        MaterialButton(onPressed: (){},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.home,color: Colors.white,),
                              Text("Home",style: TextStyle(color: Colors.white),)
                            ],
                          ),

                        ),
                        Padding(padding: EdgeInsets.only(right: 130),),
                        MaterialButton(onPressed: (){FirebaseFirestore.instance.collection('User').doc(
                            widget.docID).delete();
                        Navigator.push(context, MaterialPageRoute(builder: (context){return RegistrationScreen();}));},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.approval,color: Colors.white,),
                              Text("Sign out",style: TextStyle(color: Colors.white),)
                            ],
                          ),

                        )
                      ],
                    )
              ])
              ),

            ),

            body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 75,
            padding: EdgeInsets.only(
                top: 10,
                right: 20,
                left: 20,
                bottom: MediaQuery.of(context).size.height / 50),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black26),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                        hintText: "Search any features",
                        hintStyle: TextStyle(color: Colors.black, fontSize: 15),

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: MediaQuery.of(context).size.height / 6,
            color: Colors.white12,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                    width: 270,
                    height: 300,
                    child: Image.network(
                        'https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Nnx8fGVufDB8fHw%3D&auto=format&fit=crop&w=500&q=60')),
                Container(
                    width: 270,
                    height: 300,
                    child: Image.network(
                        'https://images.unsplash.com/photo-1583947582886-f40ec95dd752?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mzl8fHxlbnwwfHx8&auto=format&fit=crop&w=500&q=60')),
                Container(
                    width: 270,
                    height: 200,
                    child: Image.network(
                        'https://images.unsplash.com/photo-1607619056574-7b8d3ee536b2?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NjJ8fHxlbnwwfHx8&auto=format&fit=crop&w=500&q=60')),
                Container(
                    width: 270,
                    height: 300,
                    child: Image.network(
                        'https://images.unsplash.com/photo-1516574187841-cb9cc2ca948b?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Nzd8fHxlbnwwfHx8&auto=format&fit=crop&w=500&q=60')),
                Container(
                    width: 270,
                    height: 300,
                    child: Image.network(
                        'https://images.unsplash.com/photo-1537368910025-700350fe46c7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxjb2xsZWN0aW9uLXRodW1ibmFpbHx8OTUxNzQ2MHx8ZW58MHx8fA%3D%3D&dpr=1&auto=format&fit=crop&w=525&q=60')),
                Container(
                    width: 270,
                    height: 300,
                    child: Image.network(
                        'https://images.unsplash.com/photo-1542736667-069246bdbc6d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzJ8fGhvc3BpdGFsfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')),
                Container(
                    width: 270,
                    height: 300,
                    child: Image.network(
                        'https://images.unsplash.com/photo-1601839215170-6ce5854968d6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8ODN8fGhvc3BpdGFsfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')),
                Container(
                    width: 270,
                    height: 300,
                    child: Image.network(
                        'https://images.unsplash.com/photo-1579684453377-48ec05c6b30a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTUyfHxob3NwaXRhbHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')),
                Container(
                    width: 270,
                    height: 300,
                    child: Image.network(
                        'https://images.unsplash.com/photo-1542868727-6ebd18386391?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTk3fHxob3NwaXRhbHxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=500&q=60')),
                Container(
                    width: 270,
                    height: 300,
                    child: Image.network(
                        'https://images.unsplash.com/photo-1527613426441-4da17471b66d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OTV8fGhvc3BpdGFsfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')),
                Container(
                    width: 270,
                    height: 300,
                    child: Image.network(
                        'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTh8fGhvc3BpdGFsfGVufDB8fDB8&auto=format&fit=crop&w=500&q=60')),
              ],
            ),
          ),

          SizedBox(height: 60),
          // Container(
          //   height: MediaQuery.of(context).size.height / 7,color: Colors.white24,
          //   child: ListView(
          //     scrollDirection: Axis.horizontal,
          //
          //     children: <Widget>[
          //       Container(width:270,height: 200,
          //         child: Image.network('https://images.unsplash.com/photo-1581594693702-fbdc51b2763b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTQ5fHxtZWRpY2FsfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
          //       ),
          //       Container(width:270,height: 200,
          //         child: Image.network('https://images.unsplash.com/photo-1611072965169-e1534f6f300c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mjd8fHBoYXJtYWN5fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
          //       ),
          //       Container(width:270,height: 200,
          //         child: Image.network('https://images.unsplash.com/photo-1611690828081-878ab4e8416d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTM4fHxwaGFybWFjeXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
          //       ),
          //       Container(width:270,height: 200,
          //         child: Image.network('https://images.unsplash.com/photo-1576091160550-2173dba999ef?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8aGVhbHRoY2FyZXxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=500&q=60'),
          //       ),
          //       Container(width:270,height: 200,
          //         child: Image.network('https://images.unsplash.com/photo-1526256262350-7da7584cf5eb?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjJ8fGhlYWx0aGNhcmV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
          //       ),
          //       Container(width:270,height: 200,
          //         child: Image.network('https://images.unsplash.com/photo-1576671081837-49000212a370?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OHx8bWVkaWNhbHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
          //       ),
          //       Container(width:270,height: 200,
          //         child: Image.network('https://images.unsplash.com/photo-1575503802870-45de6a6217c8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTV8fG1lZGljYWx8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
          //       ),
          //       Container(width:270,height: 200,
          //         child: Image.network('https://images.unsplash.com/photo-1603398938378-e54eab446dde?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjF8fG1lZGljYWx8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
          //       ),
          //       Container(width:270,height: 200,
          //         child: Image.network('https://images.unsplash.com/photo-1471864190281-a93a3070b6de?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8NDF8fG1lZGljYWx8ZW58MHx8MHw%3D&auto=format&fit=crop&w=500&q=60'),
          //       ),
          //       Container(width:270,height: 200,
          //         child: Image.network('https://images.unsplash.com/photo-1538333702852-c1b7a2a93001?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NDR8fG1lZGljYWx8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
          //       ),
          //       Container(width:270,height: 200,
          //         child: Image.network('https://images.unsplash.com/photo-1583912267550-d974311a9a6e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTA5fHxtZWRpY2FsfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
          //       ),
          //
          //
          //     ],
          //   ),
          // ),

          Card(
              color: Colors.white30,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 6,
                    vertical: MediaQuery.of(context).size.height / 52),
                child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return LabReports(docID: widget.docID,);
                          }));
                    },
                    color: Colors.black38,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.article_rounded,
                          size: 20,
                        ),
                        Text(
                          "My Lab Reports",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    )),
              )),

          Card(
              color: Colors.white30,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 6,
                    vertical: MediaQuery.of(context).size.height / 52),
                child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return AddReport(docID: widget.docID,);
                          }));
                    },
                    color: Colors.black38,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.article_rounded,
                          size: 20,
                        ),
                        Text(
                          "Add Report",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    )),
              )),
          Card(
            color: Colors.white30,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 6,
                  vertical: MediaQuery.of(context).size.height / 52),
              child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return SpecialistList();
                        }));
                  },
                  color: Colors.black38,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.article_rounded,
                        size: 20,
                      ),
                      Text(
                        "Doctor Appointments",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ],
                  )),
            ),
          ),
          Card(
              color: Colors.white30,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 6,
                    vertical: MediaQuery.of(context).size.height / 52),
                child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ScreenOne()));
                    },
                    color: Colors.black38,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.article_rounded,
                          size: 20,
                        ),
                        Text(
                          "Pathalogy",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    )),
              )),
        ],
      ),
    );
  }
}
