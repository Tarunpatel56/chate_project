import 'dart:io';

import 'package:facebook/home/chat_screen.dart';
import 'package:facebook/models/chat_user_model.dart';
import 'package:facebook/models/user_status_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_story_view/models/story_item.dart';
import 'package:story_maker/story_maker.dart';
import 'package:flutter_story_view/flutter_story_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? image;
  bool isLoading = true;

  final List<ChatUserModel> chatMessageList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() {
    isLoading = true;
    for (var msg in Dummychat) {
      chatMessageList.add(ChatUserModel.fromJson(msg));
    }
    isLoading = false;
    setState(() {});
  }

  // final List<Map<String, String>> users = const [
  //   {"name": "Joshua", "image": "https://i.pravatar.cc/150?img=12"},
  //   {"name": "Martin", "image": "https://i.pravatar.cc/150?img=30"},
  //   {"name": "Katherine", "image": "https://i.pravatar.cc/150?img=50"},
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage("assets/Oval.png"),
          ),
        ),

        title: Text("Chats", style: TextStyle(fontSize: 30)),

        actions: [
          IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
          IconButton(icon: Icon(Icons.edit_document), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                hint: Text("Search", style: TextStyle(fontSize: 18)),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(height: 500, child: buildStory(context)),
            SizedBox(
              height: 100, // thoda height bada liya
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: userData.length + 1,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          child: Icon(Icons.add, size: 30),
                        ),
                        SizedBox(height: 6),
                        Text("Your Story"),
                      ],
                    );
                  }

                  final user = userData[index - 1];
                  return InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(user["image"] ?? ""),
                        ),
                        const SizedBox(height: 6),
                        Text(user["name"] ?? ""),
                      ],
                    ),
                  );
                },
              ),
            ),

            Expanded(
              child: ListView.separated(
                itemCount: chatMessageList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return _chatecard(chatMessageList[index]);
                },
                separatorBuilder: (context, index) => SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chatecard(ChatUserModel data) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(user: data, user2: data),
          ),
        );
      },
      leading: CircleAvatar(backgroundImage: NetworkImage(data.image ?? '')),
      title: Text(
        data.name ?? '',
        overflow: TextOverflow.ellipsis, // overflow fix
        maxLines: 1,
      ),
      subtitle: Text(
        data.message ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  List<StoryItem> storyItems = [
    StoryItem(
      type: StoryItemType.image,
      url: "https://picsum.dev/300/200",
      duration: 3,
    ),
    StoryItem(
      type: StoryItemType.image,
      url: "https://picsum.dev/300/200",
      duration: 3,
    ),
    StoryItem(
      type: StoryItemType.image,
      url: "https://picsum.dev/300/200",
      duration: 3,
    ),
  ];

  Widget buildStory(context) {
    return FlutterStoryView(
      storyItems: storyItems,
      onPageChanged: (int) {},
      onComplete: () {},
    );
  }
}

// Widget _pickImage(StoryItem data)  {
//   return Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ElevatedButton(
//           onPressed: () async {
//             await [Permission.photos, Permission.storage].request();
//             final picker = ImagePicker();
//             final pickedFile = await picker.pickImage(
//               source: ImageSource.gallery,
//             );
//             if (pickedFile != null) {
//               final editedFile = await Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => StoryMaker(filePath: pickedFile.path),
//                 ),
//               );
//               setState(() {
//                 image = editedFile;
//               });
//               print('editedFile: ${image?.path}');
//             }
//           },
//           child: const Text('Pick Image'),
//         ),
//         if (image != null) Expanded(child: Image.file(image!)),
//       ],
//     ),
//   );

// }
