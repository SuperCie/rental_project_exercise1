import 'package:balirental_project1/components/mybutton.dart';
import 'package:balirental_project1/components/mytextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  TextEditingController emailControler = TextEditingController();

  TextEditingController pwControler = TextEditingController();

  void login(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailControler.text, password: pwControler.text);
      if (context.mounted) Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Login successfuly"),
        backgroundColor: Colors.green,
      ));
    } catch (e) {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SafeArea(
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                  Text(
                    'Sign into your account',
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // TextField Email & Password
                  Mytextfield(
                    controller: emailControler,
                    text: 'Email / Username / Phone Number',
                    obscureText: false,
                  ),
                  Mytextfield(
                    controller: pwControler,
                    text: 'Password',
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Forgot Password?',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              ),
              // bottom UI
              Column(
                children: [
                  // Login Button
                  Mybutton(
                    width: double.infinity,
                    text: 'L O G I N',
                    ontap: () => login(context),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Switch to Register Page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't Have an account? "),
                      GestureDetector(
                        onTap: onTap,
                        child: Text(
                          'Register Here',
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
    );
  }
}
