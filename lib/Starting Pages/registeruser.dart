import 'package:flutter_app/Starting Pages/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';


class RegistrationScreen extends StatefulWidget {

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _passsword = TextEditingController();

  Future registerUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text,
          password: _passsword.text,
      );
      print("user registered");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
      title: Text("Register Screen"),
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

          ),
          Padding(padding: EdgeInsets.all(10.0)),
          SizedBox(height: 20,),
          TextFormField(
            controller: _passsword,
            obscureText: true,
            decoration: InputDecoration(border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black26)
                ),
                hintText: "enter password here"),
            validator: MultiValidator([
              RequiredValidator(errorText: "not valid"),
              EmailValidator(errorText: "Required"),
            ]),
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: _passsword,
            obscureText: true,
            decoration: InputDecoration(border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black26)
                ),
                hintText: "enter comfirm password here"),
            validator: MultiValidator([
              RequiredValidator(errorText: "not valid"),
              EmailValidator(errorText: "Required"),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){return LoginScreen(docID: _email.toString(),);}));
            registerUser();}, child: Text("Register User"),
            style: ElevatedButton.styleFrom(
              primary: Colors.brown
          ),
          )
        ],
        ),
      ),
    );
  }
}
