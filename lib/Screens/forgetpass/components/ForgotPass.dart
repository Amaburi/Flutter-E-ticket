import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:nyobaauth/Screens/forgetpass/components/ForgotPass.dart';
import 'package:nyobaauth/home.dart';

import '../../../../../components/already_have_an_account_acheck.dart';
import '../../../../../constants.dart';
import '../../Signup/signup_screen.dart';

class Forgetpass extends StatefulWidget {
  const Forgetpass({
    Key? key,
  }) : super(key: key);

  @override
  State<Forgetpass> createState() => _ForgetpassState();
}
class _ForgetpassState extends State<Forgetpass>{
  final _emailController = TextEditingController();

  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  Future ResetPassword () async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());

      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text('Password Link Sent! check your email!'),
        );

      });

    } on FirebaseAuthException catch (err){
      print(err);
      showDialog(
        context: context,
        // false = user must tap button, true = tap outside dialog
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text('The Error'),
            content: Text(err.toString().toLowerCase()),
          );
        },
      );
    }
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
                  hintText: "Your email we will sent a link to reset it",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.person),
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            ElevatedButton(
              onPressed: ResetPassword,
              child: Text(
                "Reset Password".toUpperCase(),
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
          ],
        ),

      ),
    );

  }
}