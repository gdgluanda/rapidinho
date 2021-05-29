import 'package:flutter/material.dart';
import 'package:rapidinho/database/database.dart';
import 'package:rapidinho/database/tables/account_table.dart';
import 'package:rapidinho/model/profile.dart';
import 'package:sqflite/sqflite.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool visible = false;
  TextEditingController nameController = new TextEditingController(),
      passwordController = new TextEditingController(),
      phoneController = new TextEditingController(),
      addressController = new TextEditingController(),
      emailController = new TextEditingController();
  RapidinhoDatabase database = RapidinhoDatabase();
  Database db;

  @override
  void initState() {
    super.initState();
    database.initDB().then((value) => db = value);
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  // widgets of Sign Up Page
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black87),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                child: Text(
                  "Create\nAccount",
                  style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Name",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 24.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 14.0),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: new OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    fillColor: Color.fromRGBO(0, 0, 0, 0.1),
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 24.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: visible ? false : true,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: _toggelVisible,
                      color: Colors.black26,
                      icon: visible
                          ? Icon(Icons.visibility_outlined)
                          : Icon(Icons.visibility_off_outlined),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 14.0),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: new OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    fillColor: Color.fromRGBO(0, 0, 0, 0.1),
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Phone",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 24.0),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 14.0),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: "Phone",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: new OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    fillColor: Color.fromRGBO(0, 0, 0, 0.1),
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Address",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 24.0),
                child: TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 14.0),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: "Address",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: new OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    fillColor: Color.fromRGBO(0, 0, 0, 0.1),
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 24.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 14.0),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: new OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    fillColor: Color.fromRGBO(0, 0, 0, 0.1),
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: OutlinedButton(
                  onPressed: _saveToDatabase,
                  child: Text(
                    "Create an account",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    backgroundColor: Colors.red,
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
    );
  }

  // toggle to visible password field
  void _toggelVisible() {
    if (visible) {
      setState(() {
        visible = false;
      });
    } else {
      setState(() {
        visible = true;
      });
    }
  }

  // check all fields is not empty first
  // created new profile object then added to database
  void _saveToDatabase() {
    final name = nameController.text;
    final password = passwordController.text;
    final phone = phoneController.text;
    final address = addressController.text;
    final email = emailController.text;
    if (name.length > 0 &&
        password.length > 0 &&
        phone.length > 0 &&
        address.length > 0) {
      Profile newProfile = new Profile(
          name: name,
          password: password,
          phone: phone,
          address: address,
          email: email);
      AccountTable.createAccount(
          newProfile, db); // insert new profile to database
      Navigator.pop(context); // back to login page
    }
  }
}
