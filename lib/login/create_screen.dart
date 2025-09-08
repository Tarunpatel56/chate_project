import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController conformpasswordcontroller =
      TextEditingController();
  bool hidepassword = true;
  final formkey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                Container(
                  height: 50,
                  width: 50,
                  child: Image.asset("assets/logo.webp"),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                TextFormField(
                  controller: namecontroller,
                  validator: (value) {
                    if (value!.contains(" ") == false) {
                      return "please enter your name";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hint: Text("Name"),
                    label: Text("Enter your name "),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: numbercontroller,

                  validator: (value) {
                    if (value!.length <= 10 == false) {
                      return "please enter your number";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hint: Text("Number"),
                    label: Text("Enter your Number "),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: emailcontroller,
                  validator: (value) {
                    if (value!.contains("@gmail.com") == false) {
                      return "please enter your email";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hint: Text("Email"),
                    label: Text("Enter your email "),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: passwordcontroller,
                  validator: (value) {
                    if (value!.length > 8 == false) {
                      return "please enter your password";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hint: Text("Password"),
                    label: Text("Enter your Password "),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: conformpasswordcontroller,
                  validator: (value) {
                    if (value!.length > 8 == false) {
                      return "please enter your password";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hint: Text("Conform Password"),
                    label: Text("Enter your Conform password "),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate() == false) return;
                      Navigator.pop(context);
                      _createAccount();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 2, 105, 189),
                    ),
                    child: Text(
                      "Create Account",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _createAccount() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Account Created: ${userCredential.user?.email}"),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = "Password is too weak.";
      } else if (e.code == 'email-already-in-use') {
        message = "Email is already in use.";
      } else if (e.code == 'invalid-email') {
        message = "Invalid email address.";
      } else {
        message = "Error: ${e.message}";
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }
}
