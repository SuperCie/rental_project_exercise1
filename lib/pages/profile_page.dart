import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Padding(
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
                        color: Colors.indigo.shade200,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.grey.shade100,
                              child: Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Charles Putra',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              'Charlesputra12@gmail.com',
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
                              child: Container(
                                margin: EdgeInsets.all(8),
                                padding: EdgeInsets.all(8),
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white),
                                child: Text(
                                  'Edit Profile',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              onTap: () {},
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
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: ListTile(
                      leading: Icon(Icons.key_outlined),
                      title: Text(
                        'Change Password',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      onTap: () {},
                    ),
                  ),
                  // privacy policy
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: ListTile(
                      leading: Icon(Icons.lock),
                      title: Text('Privacy Policy',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ),
                  // settings
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ),
                  // delete account
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Delete Account',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ),
                  // logout
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Logout',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
