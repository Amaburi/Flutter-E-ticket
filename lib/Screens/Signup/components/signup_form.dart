import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../../home.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}
class _SignUpFormState extends State<SignUpForm>{

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordconfirmation = TextEditingController();
  final _nameController = TextEditingController();
  final _RoleController = TextEditingController();



  var options = [
    'User',
    'Admin',
  ];
  var _currentItemSelected = "User";
  var rool = "User";

  void CreateDialogue(){
    CupertinoAlertDialog(
      title: Text('Account Created!!!'),
      content: Text('Want to Login or stay here?'),
      actions: [
        CupertinoDialogAction(
          child: Text('No'),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          child: Text('Yes'),
          onPressed: (){
            Navigator.push(
              context, MaterialPageRoute(
              builder: (context) {
                return LoginScreen();
              },
            ),
            );
          },
        ),
      ],
    );
  }

  Future SignUp() async{
    try {
      if (passwordConfirmed() == true){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());

        //Users Details
        adduserdetails(_nameController.text.trim(), _emailController.text.trim(), rool).catchError((err){
        });

        Navigator.push(
          context, MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        ),
        );

      }
    } on FirebaseAuthException catch  (err) {
      Fluttertoast.showToast(msg: err.message!, gravity: ToastGravity.TOP);
    }
  }


  Future adduserdetails(String name,String email, String rool ) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid!.toString();
    await FirebaseFirestore.instance.collection('Users').add({
      'name': name,
      'email': email,
      'role': rool,
      'uid' : uid
    });
  }
  bool passwordConfirmed(){
    if(_passwordController.text == _passwordconfirmation.text){
      return true;
    }else{
      return false;
    }
  }
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _RoleController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (name) {},
              decoration: InputDecoration(
                hintText: "Your Name",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: InputDecoration(
                hintText: "Your email",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _passwordconfirmation,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Password Confirmation",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Role : ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              DropdownButton<String>(
                dropdownColor: kPrimaryColor,
                isDense: true,
                isExpanded: false,
                iconEnabledColor: Colors.white,
                focusColor: Colors.white,
                items: options.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(
                      dropDownStringItem,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (newValueSelected) {
                  setState(() {
                    _currentItemSelected = newValueSelected!;
                    rool = newValueSelected;
                  });
                },
                value: _currentItemSelected,
              ),
            ],
          ),

          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: SignUp,
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}