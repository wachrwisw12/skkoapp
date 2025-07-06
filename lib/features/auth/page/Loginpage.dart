import 'package:flutter/material.dart';
import 'package:skkoapp/features/auth/widgets/line_login_button.dart';
import 'package:skkoapp/features/auth/widgets/login_fake_button.dart';


class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              // color: Colors.blue,
              child: Center(
                child: Image.asset(
                  'assets/images/logo_login.png',
                  width: 600,
                  height: 600,
                ),
              ), // Approximately 25% of screen height
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      child: Center(
                        child: LineLoginButton(onPressed: () {  },),
                      ),
                    ),
                  SizedBox(height: 40,child: Center(child: LoginFakeButton(),),)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
