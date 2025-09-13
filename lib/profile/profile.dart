import 'dart:io';
import 'package:facebook/login/login_screen.dart';
import 'package:facebook/models/user_model.dart';
import 'package:flutter/material.dart';

import '../utils/sp.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;
  UserModel? userModel;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    UserModel? data = await SPref().getUserData();
    setState(() {
      userModel = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: Container(
                      height: 90,
                      width: 90,
                      child: CircleAvatar(
                        backgroundImage:
                            userModel?.image != null &&
                                userModel!.image.isNotEmpty
                            ? NetworkImage(userModel!.image)
                            : const AssetImage("assets/default_avatar.png")
                                  as ImageProvider,
                      ),
                    ),
                  ),
                  Text(
                    userModel?.name ?? "Unknown User",
                    style: const TextStyle(fontSize: 25),
                  ),
                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Image.asset("assets/icon1.png"),
                          const Text("Audio"),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset("assets/icon2.png"),
                          const Text("Video"),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset("assets/icon3.png"),
                          const Text("Profile"),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset("assets/icon4.png"),
                          const Text("Mute"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  optionRow("Color", trailing: Image.asset("assets/icon5.png")),
                  optionRow("Emoji", trailing: Image.asset("assets/icon6.png")),
                  optionRow(
                    "Nicknames",
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "More actions",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),

                  optionRow(
                    "Search in Conversation",
                    trailing: const Icon(Icons.search),
                  ),
                  optionRow("Create group", trailing: const Icon(Icons.group)),

                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Privacy",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                  optionRow(
                    "Notifications",
                    trailing: TextButton.icon(
                      onPressed: () {},
                      label: const Text("on"),
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  optionRow(
                    "Ignore Messages",
                    trailing: const Icon(Icons.browse_gallery),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text("Log out"),
                  ),
                ],
              ),
            ),
    );
  }

  /// Reusable row widget for cleaner code
  Widget optionRow(String title, {required Widget trailing}) {
    return Column(
      children: [
        Row(
          children: [
            Text(title, style: const TextStyle(fontSize: 20)),
            const Spacer(),
            trailing,
          ],
        ),
        const Divider(),
      ],
    );
  }
}

// import 'dart:io'; import 'package:flutter/material.dart'; import 'package:founderfamilyapp/model/user_model.dart'; import '../sp/sp.dart'; class ProfileScreen extends StatefulWidget { const ProfileScreen({super.key}); @override State<ProfileScreen> createState() => _ProfileScreenState(); } class _ProfileScreenState extends State<ProfileScreen> { File? image; UserModel? userModel; @override void initState() { // TODO: implement initState super.initState(); } loadData() async{ userModel = await SPref().getUserData(); } @override Widget build(BuildContext context) { return Scaffold( body: Padding( padding: const EdgeInsets.all(8.0), child: Column( children: [ SizedBox(height: 50), Center( child: Container( height: 90, width: 90, child: CircleAvatar( backgroundImage: NetworkImage(userModel!.image), ), ), ), Text("Martha Craig", style: TextStyle(fontSize: 25)), SizedBox(height: 30), Row( mainAxisAlignment: MainAxisAlignment.spaceAround, children: [ Column( children: [Image.asset("assets/icon1.png"), Text("Audio")], ), Column( children: [Image.asset("assets/icon2.png"), Text("Video")], ), Column( children: [Image.asset("assets/icon3.png"), Text("Profile")], ), Column( children: [Image.asset("assets/icon4.png"), Text("Mute")], ), ], ), SizedBox(height: 20), Row( children: [ Text("Color", style: TextStyle(fontSize: 20)), Spacer(), Image.asset("assets/icon5.png"), ], ), SizedBox(height: 10), Divider(), SizedBox(height: 10), Row( children: [ Text("Emoji", style: TextStyle(fontSize: 20)), Spacer(), Image.asset("assets/icon6.png"), ], ), SizedBox(height: 10), Divider(), SizedBox(height: 10), Row( children: [ Text("Nicknames", style: TextStyle(fontSize: 20)), Spacer(), IconButton( onPressed: () {}, icon: Icon(Icons.arrow_forward_ios, color: Colors.grey), ), ], ), SizedBox(height: 10), Align( alignment: Alignment.bottomLeft, child: Text( "More actions", style: TextStyle(fontSize: 20, color: Colors.grey), ), ), SizedBox(height: 10), Row( children: [ Text("Search in Conversation", style: TextStyle(fontSize: 20)), Spacer(), IconButton(onPressed: () {}, icon: Icon(Icons.search)), ], ), SizedBox(height: 5), Divider(), SizedBox(height: 5), Row( children: [ Text("Create group", style: TextStyle(fontSize: 20)), Spacer(), IconButton(onPressed: () {}, icon: Icon(Icons.group)), ], ), Align( alignment: Alignment.bottomLeft, child: Text( "Privacy", style: TextStyle(color: Colors.grey, fontSize: 20), ), ), SizedBox(height: 5), Row( children: [ Text("Notifications", style: TextStyle(fontSize: 20)), Spacer(), TextButton.icon( onPressed: () {}, label: Text("on"), icon: Icon(Icons.arrow_forward_ios), ), ], ), Divider(), Row( children: [ Text("Ignore Messages", style: TextStyle(fontSize: 20)), Spacer(), IconButton(onPressed: () {}, icon: Icon(Icons.browse_gallery)), ], ), Divider(), Align( alignment: Alignment.bottomLeft, child: Text("Block", style: TextStyle(fontSize: 20)), ), ], ), ), ); } }import 'dart:io'; import 'package:flutter/material.dart'; import 'package:founderfamilyapp/model/user_model.dart'; import '../sp/sp.dart'; class ProfileScreen extends StatefulWidget { const ProfileScreen({super.key}); @override State<ProfileScreen> createState() => _ProfileScreenState(); } class _ProfileScreenState extends State<ProfileScreen> { File? image; UserModel? userModel; @override void initState() { // TODO: implement initState super.initState(); } loadData() async{ userModel = await SPref().getUserData(); } @override Widget build(BuildContext context) { return Scaffold( body: Padding( padding: const EdgeInsets.all(8.0), child: Column( children: [ SizedBox(height: 50), Center( child: Container( height: 90, width: 90, child: CircleAvatar( backgroundImage: NetworkImage(userModel!.image), ), ), ), Text("Martha Craig", style: TextStyle(fontSize: 25)), SizedBox(height: 30), Row( mainAxisAlignment: MainAxisAlignment.spaceAround, children: [ Column( children: [Image.asset("assets/icon1.png"), Text("Audio")], ), Column( children: [Image.asset("assets/icon2.png"), Text("Video")], ), Column( children: [Image.asset("assets/icon3.png"), Text("Profile")], ), Column( children: [Image.asset(
