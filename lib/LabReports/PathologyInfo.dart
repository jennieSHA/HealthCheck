import 'package:flutter/material.dart';
import 'package:flutter_app/LabInterface/UploadReport.dart';

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_outlined),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.9,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(5.0)),
                    Text(
                      'Healthy India 2021 Full Body Checkup',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Divider(),
                    Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(1.0)),
                        Text(
                            'Includes 82 tests\nFBS,CBC,Hb1Ac,Iron Profile,KFT,Lipid,TFT-Total,Urine,R/M'),
                        Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 25.0)),
                            Text(
                              "Recommended for:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text(
                              "Male , Female",
                              style: TextStyle(fontSize: 12.0),
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 25.0)),
                            Text(
                              "Age Group:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text(
                              '5-99yr',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text(
                                'Details',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ScreenTwo()));
                              },
                              color: Colors.black38,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.9,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(5.0)),
                    Text(
                      'Typhoid Test',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Divider(),
                    Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(1.0)),
                        Text('Includes 29 tests\nCBC,Typhi Dot-lgM,Widal'),
                        Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 25.0)),
                            Text(
                              "Recommended for:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text(
                              "Male , Female",
                              style: TextStyle(fontSize: 12.0),
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 25.0)),
                            Text(
                              "Age Group:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text(
                              '5-99yr',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text(
                                'Details',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ScreenThree()));
                              },
                              color: Colors.black38,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.9,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(5.0)),
                    Text(
                      'Covid-19 Antibody-lgG Test',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Divider(),
                    Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(1.0)),
                        Text('Includes 1 Tests\nCOVID-19 Antibody-lgG'),
                        Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 25.0)),
                            Text(
                              "Recommended for:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text(
                              "Male , Female",
                              style: TextStyle(fontSize: 12.0),
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 25.0)),
                            Text(
                              "Age Group:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text(
                              '5-99yr',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text(
                                'Details',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ScreenFour()));
                              },
                              color: Colors.black38,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.9,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(5.0)),
                    Text(
                      'Covid-19 Antibody-lgG Test',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Divider(),
                    Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(1.0)),
                        Text('Includes 1 Tests\nCOVID-19 Antibody-lgG'),
                        Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.0,
                                    vertical:
                                        MediaQuery.of(context).size.height /
                                            50)),
                            Text(
                              "Recommended for:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text(
                              "Male , Female",
                              style: TextStyle(fontSize: 12.0),
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 25.0)),
                            Text(
                              "Age Group:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text(
                              '5-99yr',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text(
                                'Details',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ScreenFour()));
                              },
                              color: Colors.black38,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Package Details'),
          backgroundColor: Colors.blueGrey,
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.33,
                color: Colors.grey,
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text('Lipid Profile (9)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Liver Function Test(12)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Complete Hemogram (24)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Iron Studies (3)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Kidney Function Test (10)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Hb1Ac (2)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Vitamin B12'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Vitamin D'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('IgE Total antibody'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Bacteria'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Bile Pigments(bilirubin)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('URINE KETONE'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Red blood cells'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Pus cells'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                          'CRP(C eactve Arthritis Factor,Quantitative (1)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Amylase enzymatic,Serum (1)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Covid-19 Antibody-lgG (1)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Blood Glucose Fasting (1)'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blueGrey,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: SizedBox(
                height: 70,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      return showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: Text(
                                  'Booking Successful!!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                actions: [
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Ok',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)))
                                ],
                              ));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '669/-  ',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          '   Book Now',
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Package Details'),
          backgroundColor: Colors.blueGrey,
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.33,
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text('Lipid Profile (9)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Liver Function Test(12)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Complete Hemogram (24)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Iron Studies (3)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Kidney Function Test (10)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Hb1Ac (2)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Vitamin B12'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Vitamin D'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('IgE Total antibody'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Bacteria'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Bile Pigments(bilirubin)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('URINE KETONE'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Red blood cells'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Pus cells'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                          'CRP(C eactve Arthritis Factor,Quantitative (1)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Amylase enzymatic,Serum (1)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Covid-19 Antibody-lgG (1)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Blood Glucose Fasting (1)'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blueGrey,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: SizedBox(
                height: 70,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      return showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: Text(
                                  'Booking Successful!!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                actions: [
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Ok',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)))
                                ],
                              ));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '669/-  ',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          '   Book Now',
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Package Details'),
          backgroundColor: Colors.blueGrey,
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.33,
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text('Lipid Profile (9)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Liver Function Test(12)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Complete Hemogram (24)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Iron Studies (3)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Kidney Function Test (10)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Hb1Ac (2)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Vitamin B12'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Vitamin D'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('IgE Total antibody'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Bacteria'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Bile Pigments(bilirubin)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('URINE KETONE'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Red blood cells'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Pus cells'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                          'CRP(C eactve Arthritis Factor,Quantitative (1)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Amylase enzymatic,Serum (1)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Covid-19 Antibody-lgG (1)'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Blood Glucose Fasting (1)'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blueGrey,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: SizedBox(
                height: 70,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      return showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: Text(
                                  'Booking Successful!!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                actions: [
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Ok',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)))
                                ],
                              ));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '669/-  ',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          '   Book Now',
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
