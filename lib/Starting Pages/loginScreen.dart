import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'createprofile.dart';

class LoginScreen extends StatefulWidget {
  String docID;
  LoginScreen({this.docID});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _passsword = TextEditingController();
  GlobalKey<FormState> formkey =GlobalKey<FormState>();

  void validate(){
    if(formkey.currentState.validate()){
      print("ok");
    }else{
      print("Error");
    }
  }
  String emailvalidate(value){
    if(value.isEmpty){
      return "Error";
    }else{
      return null;
    }
  }


  Future loginUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text,
          password: _passsword.text,
      );
      print("user logged in");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
      title: Text("Login Screen"),
      backgroundColor: Colors.grey,
    ),
      body: Form(
        key: formkey,
        child: Column(children: [
          Padding(padding: EdgeInsets.all(10.0)),
          TextFormField(
            controller: _email,
            decoration: InputDecoration(border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black26)
                ),
                hintText: "enter email here"),
              validator: MultiValidator([
                RequiredValidator(errorText: "not valid"),
                EmailValidator(errorText: "Required"),
              ]),
              onChanged: (val){
              widget.docID= val;
            print(widget.docID);
            }),
          SizedBox(height: 20,),
          TextFormField(
            obscureText: true,
            controller: _passsword,
            decoration: InputDecoration(border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black26)
                ),
              hintText: "enter password here"
               ),
            validator: MultiValidator([
              RequiredValidator(errorText: "not valid"),
              MinLengthValidator(8, errorText: "At least 8 characters required"),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: (){
                //docID = _email.toString();
            print("*****"+widget.docID);
            validate();
            if(formkey.currentState.validate()){
              return Navigator.push(context, MaterialPageRoute(builder: (context){return CreateProfile(docID: widget.docID);}));
             }else{
              return null;
            }
            },
           // Navigator.push(context, MaterialPageRoute(builder: (context){return HomepageScreen(docID: docID,);}));
            //Navigator.push(context, MaterialPageRoute(builder: (context){return CreateProfile(docID: "tanaya@gmail.com",);}));
              style: ElevatedButton.styleFrom(
                primary: Colors.brown
              ),
              child: Text("Login"))
        ],
        ),
      ),
    );
  }
}
