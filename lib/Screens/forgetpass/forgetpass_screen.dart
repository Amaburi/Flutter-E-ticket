import 'package:flutter/material.dart';
import 'package:nyobaauth/Screens/forgetpass/components/ForgotPass.dart';
import 'package:nyobaauth/responsive.dart';

import '../../components/background.dart';

import 'components/forgetpass_screen_top_image.dart';

class passwordScreen extends StatelessWidget {
  const passwordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          child: Icon( Icons.arrow_back_ios, color: Colors.black,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Responsive(
            mobile: const MobileLoginScreen(),
            desktop: Row(
              children: [
                const Expanded(
                  child: LoginScreenTopImage(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 450,
                        child: Forgetpass(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: Forgetpass(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
