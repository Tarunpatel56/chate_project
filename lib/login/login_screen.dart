import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook/home/home_screen.dart';
import 'package:facebook/login/create_screen.dart';
import 'package:facebook/models/user_model.dart';
import 'package:facebook/utils/sp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.3),
                  Icon(Icons.lock, size: 60),
                  SizedBox(height: 20),
                  Text(
                    'Welcome',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text("Login without email & password"),
                  SizedBox(height: 30),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        googleLogin(context);
                      },
                      style: OutlinedButton.styleFrom(
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(5),
                        ),
                      ),
                      icon: Icon(Icons.account_circle_sharp, size: 30),
                      label: Text(
                        "Continue with Google",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 50,
                  //   width: 50,

                  //   // child: Image.asset("assets/logo.webp"),
                  // ),
                  // SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                  // TextFormField(
                  //   controller: emailcontroller,
                  //   validator: (value) {
                  //     if (value!.contains("@gmail.com") == false) {
                  //       return "please enter valid email";
                  //     }
                  //   },
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(),
                  //     hint: Text("email"),
                  //     label: Text("enter your email or mobile"),
                  //   ),
                  // ),
                  // SizedBox(height: 10),
                  // TextFormField(
                  //   controller: passwordcontroller,
                  //   validator: (value) {
                  //     if (value!.length > 8 == false) {
                  //       return "please enter valid password";
                  //     }
                  //   },
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(),
                  //     hint: Text("Password"),
                  //     label: Text("Password"),
                  //   ),
                  // ),
                  // SizedBox(height: 10),
                  // SizedBox(
                  //   width: MediaQuery.sizeOf(context).width * 0.9,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       if (formKey.currentState!.validate() == true) {
                  //         _login();
                  //       }
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: const Color.fromARGB(255, 2, 105, 189),
                  //     ),
                  //     child: Text(
                  //       "Log in",
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                  // TextButton(onPressed: () {}, child: Text("Forgot password?")),
                  // SizedBox(
                  //   height: 50,
                  //   width: 50,
                  //   child: InkWell(
                  //     onTap: () {
                  //       googleLogin(context);
                  //     },
                  //     child: Image.asset("assets/google.png"),
                  //   ),
                  // ),

                  // IconButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => HomeScreen()),
                  //     );
                  //   },
                  //   icon: Icon(Icons.apple),
                  // ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(3),
                        ),
                      ),
                      child: Text(
                        "Continue as Guest",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  googleLogin(context) async {
    const List<String> scopes = <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ];
    final GoogleSignIn signIn = GoogleSignIn.instance;

    await signIn.initialize(
      serverClientId:
          "391545280397-tmb5lqeah6edkvo64llhg2m7pbpcu3ub.apps.googleusercontent.com",
    );
    final GoogleSignInAccount? user = await signIn.authenticate(
      scopeHint: scopes,
    );

    print("==========================");

    print(user?.displayName);
    print(user?.photoUrl);
    print(user?.email);

    if (user == null) return;
    await saveDetailsOnDB(user.id, {
      "socialId": user.id,
      "name": user.displayName,
      "email": user.email,
      "image": user.photoUrl,
    });

    await SPref().saveUserData(UserModel.fromJson(
      {
        "socialId": user.id,
        "name": user.displayName,
        "email": user.email,
        "image": user.photoUrl,
      }
    ));

    _navigateToLogin(context);
  }

  Future<void> saveDetailsOnDB(
    String socialId,
    Map<String, dynamic> userData,
  ) async {
    final CollectionReference userCollection = _firebaseFirestore.collection(
      "users",
    );

    final query = await userCollection
        .where("socialId", isEqualTo: socialId)
        .get();

    if (query.docs.isEmpty) {
      await userCollection.add(userData);
    } else {
      await userCollection.doc(query.docs.first.id).update(userData);
    }
  }

  _navigateToLogin(context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
      (route) {
        return false;
      },
    );
  }

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Welcome: ${userCredential.user?.email}")),
      );

      // Navigate to Home Page after login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = "No user found with this email.";
      } else if (e.code == 'wrong-password') {
        message = "Incorrect password.";
      } else {
        message = "Error: ${e.message}";
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }
}
