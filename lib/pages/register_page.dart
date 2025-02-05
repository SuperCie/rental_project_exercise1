import 'package:balirental_project1/components/mybutton.dart';
import 'package:balirental_project1/components/mypolicy.dart';
import 'package:balirental_project1/components/mytextfield.dart';
import 'package:balirental_project1/pages/pagecontrol.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  TextEditingController nameControler = TextEditingController();

  TextEditingController usernameControler = TextEditingController();

  TextEditingController pnController = TextEditingController();

  TextEditingController emailControler = TextEditingController();

  TextEditingController pwControler = TextEditingController();

  TextEditingController cpwControler = TextEditingController();

  void register(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Pagecontrol(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //upper UI
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // logo
                    Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/image/logo.png'),
                        radius: 70,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    // Login text
                    Text(
                      'Hello,',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                    Text(
                      'Register into your account',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // TextField Email & Password
                    Mytextfield(
                      controller: nameControler,
                      text: 'Name',
                      obscureText: false,
                    ),
                    Mytextfield(
                      controller: usernameControler,
                      text: 'Username',
                      obscureText: true,
                    ),
                    Mytextfield(
                        controller: pnController,
                        text: 'Phone Number',
                        obscureText: false,
                        keyboardType: TextInputType.number),
                    Mytextfield(
                        controller: pwControler,
                        text: 'Password',
                        obscureText: true),
                    Mytextfield(
                        controller: cpwControler,
                        text: 'Confirm Password',
                        obscureText: true),
                    Mypolicy()
                  ],
                ),
                // bottom UI
                Column(
                  children: [
                    // Register Button
                    Mybutton(
                      text: 'R E G I S T E R',
                      ontap: () => register(context),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Switch to Register Page
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Have an account? "),
                        GestureDetector(
                          onTap: onTap,
                          child: Text(
                            'Login Here',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
