import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:nyobaauth/Screens/Users/UserHome.dart';
import 'package:nyobaauth/Screens/forgetpass/forgetpass_screen.dart';
import 'package:nyobaauth/Screens/forgetpass/components/ForgotPass.dart';
import 'package:nyobaauth/home.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';
import '../../Signup/components/signup_form.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);


  @override
  State<LoginForm> createState() => _LoginFormState();
}
class _LoginFormState extends State<LoginForm>{
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool? user;

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('Users').doc(user!.uid).get().then((DocumentSnapshot documentSnapshot){
      if('role' == "User"){
        Navigator.push(
          context, MaterialPageRoute(
          builder: (context) {
            return UserHome();
          },
        ),
        );
      }else{
        Navigator.push(
          context, MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        ),
        );
      }
    });
  }

  Future SignIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
    route();
  }


  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        child: Column(
          children: [
            SingleChildScrollView(
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
            const SizedBox(height: defaultPadding),
            ElevatedButton(
                onPressed: SignIn,
                child: Text(
                  "Login".toUpperCase(),
                ),
              ),
            const SizedBox(height: defaultPadding),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: defaultPadding),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return passwordScreen();
                          },
                        ),
                      );
                    },
                    child: Text('Forgot password?', style: const TextStyle(color: kPrimaryColor),
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
}