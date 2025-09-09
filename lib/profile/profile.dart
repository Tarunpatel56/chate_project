import 'dart:io';

import 'package:facebook/models/user_status_model.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../utils/sp.dart';

class ProfleScreen extends StatefulWidget {
  const ProfleScreen({super.key});

  @override
  State<ProfleScreen> createState() => _ProfleScreenState();
}

class _ProfleScreenState extends State<ProfleScreen> {
  File? image;
  UserModel? userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  loadData() async{
   userModel =  await SPref().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),

        child: Column(
          children: [
            SizedBox(height: 50),
            Center(
              child: Container(
                height: 90,
                width: 90,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(userModel!.image),
                ),
              ),
            ),
            Text("Martha Craig", style: TextStyle(fontSize: 25)),
            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [Image.asset("assets/icon1.png"), Text("Audio")],
                ),
                Column(
                  children: [Image.asset("assets/icon2.png"), Text("Video")],
                ),
                Column(
                  children: [Image.asset("assets/icon3.png"), Text("Profile")],
                ),
                Column(
                  children: [Image.asset("assets/icon4.png"), Text("Mute")],
                ),
              ],
            ),

            SizedBox(height: 20),

            Row(
              children: [
                Text("Color", style: TextStyle(fontSize: 20)),
                Spacer(),
                Image.asset("assets/icon5.png"),
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Emoji", style: TextStyle(fontSize: 20)),
                Spacer(),
                Image.asset("assets/icon6.png"),
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Nicknames", style: TextStyle(fontSize: 20)),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "More actions",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),

            SizedBox(height: 10),
            Row(
              children: [
                Text("Search in Conversation", style: TextStyle(fontSize: 20)),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              ],
            ),
            SizedBox(height: 5),
            Divider(),
            SizedBox(height: 5),
            Row(
              children: [
                Text("Create group", style: TextStyle(fontSize: 20)),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.group)),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Privacy",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text("Notifications", style: TextStyle(fontSize: 20)),
                Spacer(),
                TextButton.icon(
                  onPressed: () {},
                  label: Text("on"),
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                Text("Ignore Messages", style: TextStyle(fontSize: 20)),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.browse_gallery)),
              ],
            ),
            Divider(),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text("Block", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
