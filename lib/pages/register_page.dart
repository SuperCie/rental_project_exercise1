import 'package:balirental_project1/components/mybutton.dart';
import 'package:balirental_project1/components/mypolicy.dart';
import 'package:balirental_project1/components/mytextfield.dart';
import 'package:balirental_project1/components/support/authgate.dart';
import 'package:balirental_project1/components/support/displaymessageuser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  TextEditingController nameControler = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController pwControler = TextEditingController();

  TextEditingController cpwControler = TextEditingController();

  void register(context) async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    // check if passwords match
    if (pwControler.text != cpwControler.text) {
      displayMessageUser("Password do not match", context);
      return;
    }

    try {
      //create user with email and password
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: pwControler.text);

      // after user is created, update the displayName
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        //update the display name
        await user.updateProfile(displayName: nameControler.text);
        await user.reload(); //reload user to get the updated data

        //success message
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("User successfuly registered"),
            backgroundColor: Colors.green,
          ),
        );

        // navigate to page
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Authgate(),
            ));
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageUser("Error: ${e.message}", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.tertiary),
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
                      controller: emailController,
                      text: 'Email',
                      obscureText: false,
                    ),
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
                      width: double.infinity,
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
