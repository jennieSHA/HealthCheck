import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/call.dart';
import 'package:flutter_app/src/pages/index.dart';
import 'package:permission_handler/permission_handler.dart';
class SpecialistList extends StatefulWidget {
  @override
  _SpecialistListState createState() => _SpecialistListState();
}

class _SpecialistListState extends State<SpecialistList> {
  List doctor = ['Coronavirus','Gynaecologist','General Physician','Orthopedic','Pediatrics',
    'Dermatology','Diet and Nutrition','Diabetes and endocrinology','Depression Specialist','Physiotherapy','Ayurveda','Homeopathy','Neurologist'];
  List images = [
    'https://images.unsplash.com/photo-1601839215170-6ce5854968d6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8ODN8fGhvc3BpdGFsfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1579684453377-48ec05c6b30a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTUyfHxob3NwaXRhbHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1542868727-6ebd18386391?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTk3fHxob3NwaXRhbHxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1527613426441-4da17471b66d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OTV8fGhvc3BpdGFsfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTh8fGhvc3BpdGFsfGVufDB8fDB8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1601839215170-6ce5854968d6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8ODN8fGhvc3BpdGFsfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1579684453377-48ec05c6b30a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTUyfHxob3NwaXRhbHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1542868727-6ebd18386391?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTk3fHxob3NwaXRhbHxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1527613426441-4da17471b66d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OTV8fGhvc3BpdGFsfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTh8fGhvc3BpdGFsfGVufDB8fDB8&auto=format&fit=crop&w=500&q=60', 'https://images.unsplash.com/photo-1601839215170-6ce5854968d6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8ODN8fGhvc3BpdGFsfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1579684453377-48ec05c6b30a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTUyfHxob3NwaXRhbHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1542868727-6ebd18386391?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTk3fHxob3NwaXRhbHxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1527613426441-4da17471b66d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OTV8fGhvc3BpdGFsfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTh8fGhvc3BpdGFsfGVufDB8fDB8&auto=format&fit=crop&w=500&q=60'
  ];
  List docName = ['Dr. Kate','Dr. Rachel','Dr. Dabi','Dr. Patil','Dr. Joey','Dr. Jain','Dr. Ross',
  'Dr. Hathi','Dr.Moni','Dr. Wani','Dr. Gate','Dr. Gada','Dr. Mehta','Dr.Mehta'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "HealthMate",
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
      body: Builder(
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
                            itemCount: doctor.length,
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
                                      docName[index],
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                    trailing: Text(doctor[index],),
                                    onTap: () {
                                      print("Tapped");
                                      onJoin();
                                      // Navigator.push(context,
                                      //     MaterialPageRoute(builder: (BuildContext context) {
                                      //       return IndexPage();
                                      //     }));
                                      //
                                    },
                                  ),
                                  Divider(),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
  Future<void> onJoin() async {
    // update input validation
    setState(() {
      //_channelController.text.isEmpty
        //  ? _validateError = true
        //  : _validateError = false;
    });
   // if (_channelController.text.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: 'Jinisha',
            role: ClientRole.Broadcaster,
          ),
        ),
      );
    //}
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}
