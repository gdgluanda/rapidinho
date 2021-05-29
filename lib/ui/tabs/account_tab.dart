import 'package:flutter/material.dart';
import 'package:rapidinho/database/database.dart';
import 'package:rapidinho/database/tables/account_table.dart';
import 'package:rapidinho/model/profile.dart';
import 'package:sqflite/sqflite.dart';

class AccountTab extends StatefulWidget {
  @override
  _AccountTabState createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> with TickerProviderStateMixin {
  bool isRead = true;
  TextEditingController nameController = new TextEditingController(),
      phoneController = new TextEditingController(),
      addressController = new TextEditingController(),
      emailController = new TextEditingController();
  RapidinhoDatabase database = RapidinhoDatabase();
  Database db;

  @override
  void initState() {
    super.initState();
    database.initDB().then((value) => db = value);
    nameController.text = currentProfile.name;
    phoneController.text = currentProfile.phone;
    addressController.text = currentProfile.address;
    emailController.text = currentProfile.email;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/images/henrick.jpg'),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      height: 30,
                      child: TextField(
                        controller: nameController,
                        readOnly: isRead ? true : false,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: isRead
                                ? BorderSide.none
                                : BorderSide(width: 1.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 30,
                      child: TextField(
                        style: TextStyle(color: Colors.black38, fontSize: 14.0),
                        controller: phoneController,
                        readOnly: isRead ? true : false,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: isRead
                                ? BorderSide.none
                                : BorderSide(width: 1.0),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          minimumSize: Size(50, 15),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          )),
                      onPressed: isRead ? _enableEdit : _updateProfile,
                      child: Text(
                        isRead ? "Edit".toUpperCase() : "Save".toUpperCase(),
                        style: TextStyle(fontSize: 10.0),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
              child: Text(
                "Account",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(right: 16.0, left: 16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 3.0),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    margin: EdgeInsets.only(bottom: 12.0),
                    child: TextField(
                      style: TextStyle(color: Colors.black38, fontSize: 14.0),
                      controller: addressController,
                      readOnly: isRead ? true : false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_on_outlined,
                          color: Colors.red,
                          size: 20.0,
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                              isRead ? BorderSide.none : BorderSide(width: 1.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    margin: EdgeInsets.only(bottom: 12.0),
                    child: TextField(
                      style: TextStyle(color: Colors.black38, fontSize: 14.0),
                      controller: emailController,
                      readOnly: isRead ? true : false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.red,
                          size: 20.0,
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                              isRead ? BorderSide.none : BorderSide(width: 1.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // change read state to edit mode
  // change from edit button to save button
  _enableEdit() {
    setState(() {
      isRead = false;
    });
  }

  // account information updated after user click save button
  _updateProfile() async {
    Profile profile = Profile(
        id: currentProfile.id,
        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        password: currentProfile.password,
        address: addressController.text);
    AccountTable accountTable = AccountTable();
    // called updateProfile method from AccountTable class
    await accountTable.updateProfile(profile, db);
    // set to original read mode state
    setState(() {
      isRead = true;
    });
  }
}
