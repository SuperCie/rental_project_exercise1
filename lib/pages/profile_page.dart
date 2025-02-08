import 'package:balirental_project1/components/mytextfield.dart';
import 'package:balirental_project1/components/support/authgate.dart';
import 'package:balirental_project1/components/support/displaymessageuser.dart';
import 'package:balirental_project1/pages/policy_page.dart';
import 'package:balirental_project1/pages/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // text controller
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController currentPwController = TextEditingController();
  TextEditingController newPwController = TextEditingController();
  TextEditingController newCPwController = TextEditingController();

// Function to refresh content
  Future<void> _refreshProfile() async {
    // Simulate a network call or data refresh, for example:
    await Future.delayed(Duration(seconds: 2)); // Simulate a delay

    setState(() {
      // Update the profile or other data here
    });
  }

  // initialize with current user data
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      nameController.text = user.displayName ?? '';
      emailController.text = user.email ?? '';
    }
  }

  // change password function
  void changePassword() {
    User? user = FirebaseAuth.instance.currentUser;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'CHANGE PASSWORD',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Mytextfield(
                controller: currentPwController,
                text: 'Current Password',
                obscureText: true),
            Mytextfield(
                controller: newPwController,
                text: 'New Password',
                obscureText: true),
            Mytextfield(
                controller: newCPwController,
                text: 'Confirm New Password',
                obscureText: true)
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () async {
                  if (user == null) {
                    displayMessageUser(
                        "No user is currently signed in", context);
                    return;
                  }

                  if (newPwController.text != newCPwController.text) {
                    displayMessageUser("New password do not match", context);
                    return;
                  }

                  try {
                    // re authenticate the user with current password
                    AuthCredential credential = EmailAuthProvider.credential(
                        email: user.email!, password: currentPwController.text);

                    await user.reauthenticateWithCredential(credential);

                    //update password
                    await user.updatePassword(newPwController.text);
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Password successfully changed"),
                        backgroundColor: Colors.green,
                      ),
                    );
                    // clear the textfield
                    currentPwController.clear();
                    newPwController.clear();
                    newCPwController.clear();
                  } on FirebaseAuthException catch (e) {
                    displayMessageUser('error : ${e.message}', context);
                    Navigator.pop(context);
                  }
                },
                child: Text("Confirm"),
              )
            ],
          )
        ],
      ),
    );
  }

  //delete account
  void delete() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'DELETE CONFIRMATION',
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Mytextfield(
                controller: emailController, text: 'Email', obscureText: false),
            Mytextfield(
                controller: pwController, text: 'Password', obscureText: true)
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () async {
                  try {
                    // Reauthenticate the user
                    User? user = FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      // Reauthenticate with the entered email and password
                      AuthCredential credential = EmailAuthProvider.credential(
                        email: emailController.text,
                        password: pwController.text,
                      );

                      // Reauthenticate the user
                      await user.reauthenticateWithCredential(credential);

                      // After successful reauthentication, delete the user account
                      await user.delete();

                      // Show success message and navigate to the login page
                      Navigator.pop(context); // Close reauthentication dialog
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Account successfully deleted')));

                      // Navigate to Login Page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Authgate()), // Replace LoginPage with your actual Login Page widget
                      );
                    }
                  } on FirebaseAuthException catch (e) {
                    Navigator.pop(context); // Close reauthentication dialog
                    displayMessageUser(
                        "Failed to delete account: ${e.message}", context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'Your account has been successfully deleted.')));
                  }
                },
                child: Text('Confirm'),
              )
            ],
          )
        ],
      ),
    );
  }

  //logout account
  void logout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'LOGOUT CONFIRMATION',
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        content: Text('Are you sure want to logout your account?'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                color: Theme.of(context).colorScheme.primary,
                child: Text('Cancel'),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  FirebaseAuth.instance.signOut();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Logout Successfuly'),
                    backgroundColor: Colors.green,
                  ));
                },
                color: Theme.of(context).colorScheme.primary,
                child: Text('Confirm'),
              ),
            ],
          )
        ],
      ),
    );
  }

  // user profile
  String getUserName() {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.displayName ??
        'No Name'; // display name from firebase or default
  }

  String getUserEmail() {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.email ?? 'No Email'; // Email from Firebase or default
  }

// update profile / edit profile
  void editProfile() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Mytextfield(
                controller: nameController, text: "Name", obscureText: false),
            Mytextfield(
                controller: emailController, text: "Email", obscureText: false),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                color: Theme.of(context).colorScheme.primary,
                child: Text('Cancel'),
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () async {
                  User? user = FirebaseAuth.instance.currentUser;
                  String newName = nameController.text.trim();
                  String newEmail = emailController.text.trim();

                  if (user == null) {
                    displayMessageUser(
                        "No user is currently signed in", context);
                    return;
                  }

                  try {
                    // Update name (displayName) if changed
                    if (newName != user.displayName) {
                      await user.updateProfile(displayName: newName);
                      await user.reload();
                    }

                    // Update email if changed
                    if (newEmail != user.email) {
                      await user.updateEmail(newEmail);
                    }

                    // Optionally, you can show a confirmation SnackBar here
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Profile updated successfully."),
                      backgroundColor: Colors.green,
                    ));
                  } on FirebaseAuthException catch (e) {
                    // Handle errors from Firebase
                    displayMessageUser(
                        "Error updating profile: ${e.message}", context);
                  } finally {
                    Navigator.pop(context); // Close the dialog
                  }
                },
                child: Text('Confirm'),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: RefreshIndicator(
          onRefresh: _refreshProfile,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                Column(
                  children: [
                    // Profile card
                    Container(
                      height: 250,
                      width: double.infinity,
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor:
                                    Theme.of(context).colorScheme.tertiary,
                                child: Icon(
                                  Icons.person,
                                  size: 50,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                getUserName(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text(
                                getUserEmail(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: editProfile,
                                child: Container(
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.all(8),
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                  child: Text(
                                    'Edit Profile',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // listtile
                    // change password
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(6),
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).colorScheme.secondary),
                        child: ListTile(
                          leading: Icon(Icons.key_outlined),
                          title: Text(
                            'Change Password',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                          onTap: changePassword,
                        ),
                      ),
                    ),
                    // privacy policy
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PolicyPage(),
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(6),
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).colorScheme.secondary),
                        child: ListTile(
                          leading: Icon(Icons.lock),
                          title: Text('Privacy Policy',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ),
                    // settings
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingsPage(),
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(6),
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).colorScheme.secondary),
                        child: ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('Settings',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ),
                    // delete account
                    GestureDetector(
                      onTap: delete,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).colorScheme.secondary),
                        child: ListTile(
                          leading: Icon(Icons.delete),
                          title: Text('Delete Account',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ),
                    // logout
                    GestureDetector(
                      onTap: logout,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).colorScheme.secondary),
                        child: ListTile(
                          leading: Icon(Icons.logout),
                          title: Text('Logout',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
