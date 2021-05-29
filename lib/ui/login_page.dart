import 'package:flutter/material.dart';
import 'package:rapidinho/database/database.dart';
import 'package:rapidinho/database/tables/account_table.dart';
import 'package:rapidinho/model/profile.dart';
import 'package:rapidinho/ui/home_page.dart';
import 'package:rapidinho/ui/signup_page.dart';
import 'package:sqflite/sqflite.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = new TextEditingController(),
      passwordController = new TextEditingController();
  RapidinhoDatabase database = RapidinhoDatabase(); // initialize the database
  Database db;

  @override
  void initState() {
    super.initState();
    database.initDB().then((value) =>
        db = value); // create the required tables at the initial state
  }

  @override
  void dispose() {
    usernameController
        .dispose(); // cannot be useable after the page is disposed
    passwordController
        .dispose(); // cannot be useable after the page is disposed
    super.dispose();
  }

  // widgets of Login Up Page
  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height; // get current phone screen height
    double width =
        MediaQuery.of(context).size.width; // get current phone screen width

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(
            new FocusNode()); // disable the keyboard by touching the screen
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "WELCOME",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 16, 50.0, 0),
                  child: TextField(
                    controller: usernameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle:
                          TextStyle(color: Colors.black38, fontSize: 14),
                      alignLabelWithHint: true,
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle:
                          TextStyle(color: Colors.black38, fontSize: 14),
                      alignLabelWithHint: true,
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.all(0.0)),
                    // ignore: sdk_version_set_literal
                    onPressed: () => {},
                    child: Text(
                      "Forgot Password ?".toUpperCase(),
                      style: TextStyle(color: Colors.black26),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 25, 50, 0),
                  child: OutlinedButton(
                    // ignore: sdk_version_set_literal
                    onPressed: _signInAccount,
                    child: Text(
                      "Sign In".toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(width, 50),
                      backgroundColor: Colors.red,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 25, 50, 0),
                  child: OutlinedButton(
                    onPressed: navigateToSignUp,
                    child: Text(
                      "Don't have an account ? Join Us",
                      style: TextStyle(color: Colors.red),
                    ),
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(width, 50),
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
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

  // navigate to sign up screen after user click "Don't have an account ? Join Us" button
  navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return SignUp();
      }),
    );
  }

  // check username and password from database
  // after user click login
  _signInAccount() {
    String name = usernameController.text;
    String password = passwordController.text;
    if (name.length > 0 && password.length > 0) {
      usernameController.clear(); // clear name text field
      passwordController.clear(); // clear password text field
      AccountTable accountTable = AccountTable();
      accountTable.getProfile(db, name, password).then((value) => value != null
          ? setLoginProfile(value)
          : print("Incorrect username and password."));
    }
  }

  // if user is valid, set the account values to global
  setLoginProfile(Profile profile) {
    currentProfile = profile;
    // route to the main page
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return HomePage(
        index: 0,
      );
    }), (Route<dynamic> route) => false);
  }
}
