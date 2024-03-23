import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:person_identifier_application/widgets/custom_elevated_button.dart';
import 'package:person_identifier_application/widgets/custom_bottom_app_bar.dart';
import 'package:person_identifier_application/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:person_identifier_application/core/app_export.dart';

import '../../real_time.dart';
import '../login_screen/login_screen.dart';

class PersonDetailScreen extends StatefulWidget {
  const PersonDetailScreen({super.key});

  @override
  State<PersonDetailScreen> createState() => _PersonDetailScreenState();
}

class _PersonDetailScreenState extends State<PersonDetailScreen> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;
  String? _name;
  String? _ID;
  String? _email;
  String? _phone;
  String? _role;
  String? _profilePicUrl;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    _user = _auth.currentUser;
    if (_user != null) {
      DocumentSnapshot<Map<String, dynamic>> userData =
      await _firestore.collection('users').doc(_user!.uid).get();
      print("User Data: $userData"); // Debug print
      setState(() {
        _name = userData['name'];
        _ID = userData['ID'];
        _email = userData['email'];
        _phone = userData['phone'];
        _role = userData['role'];
        _profilePicUrl = userData['profilePicUrl'];
      });
    }
  }

  void _editProfile() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newUsername = _name!;
        String newMobileNumber = _phone!;
        String newEmail = _email!;
        String newID = _ID!;
        String newRole = _role!;
        return AlertDialog(
          title: Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  newUsername = value;
                },
                decoration: InputDecoration(
                  labelText: 'New Name',
                ),
              ),

              TextField(
                onChanged: (value) {
                  newRole = value;
                },
                decoration: InputDecoration(
                  labelText: 'New Role',
                ),
              ),
              TextField(
                onChanged: (value) {
                  newMobileNumber = value;
                },
                decoration: InputDecoration(
                  labelText: 'New Mobile Number',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _saveChanges(newUsername, newMobileNumber, newRole);
                Navigator.of(context).pop();
              },
              child: Text('Save',
                 style: TextStyle(color: Colors.white,),

            ),
            )],
        );
      },
    );
  }

  Future<void> _saveChanges(String newUsername, String newMobileNumber,String newRole) async {
    await _firestore.collection('users').doc(_user!.uid).update({
      'name': newUsername,
      'phone': newMobileNumber,
      'role' : newRole,

    });
    setState(() {
      _name = newUsername;
      _phone = newMobileNumber;
      _role = newRole;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 13.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 20.h,
                      right: 20.h,
                      bottom: 10.v,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 28.h,
                      vertical: 19.v,
                    ),
                    decoration: AppDecoration.gradientTealToLime.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder20,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                          Center(
                            child: Text(
                              "$_role",
                              style: CustomTextStyles.titleMedium_1,
                            ),
                          ),

                        Center(child: SizedBox(height: 12.v)),
                          _profilePicUrl != null
                          ? Center(
                            child: CircleAvatar(
                            backgroundImage: NetworkImage(_profilePicUrl!),
                            radius: 75,
                            ),
                          )
                          : Center(
                            child: CircleAvatar(
                                radius: 75,
                                child: Icon(Icons.person),),
                          ),
                          Center(child: SizedBox(height: 20.v)),
                        Text(
                          "Main Details",
                          style: CustomTextStyles.titleMediumTeal600,
                        ),
                        SizedBox(height: 20.v),
                        Center(
                          child: Container(
                            width: 243.h,
                            margin: EdgeInsets.only(right: 16.h),
                            child: Text(
                              "Name - $_name\nEmail - $_email \nID - $_ID\nRole - $_role\nMobile NO. - $_phone\n",
                              maxLines: 12,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                height: 2.14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 57.v),
                        CustomElevatedButton(
                          text: "Update",
                          margin: EdgeInsets.symmetric(horizontal: 30.h),
                          alignment: Alignment.center,
                          onPressed: _editProfile,
                        ),
                        SizedBox(height: 10.v),
                        CustomElevatedButton(
                          text: "Log Out",
                          margin: EdgeInsets.symmetric(horizontal: 30.h),
                          alignment: Alignment.center,

                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => LoginScreen()));
                          },

                        ),
                        SizedBox(height: 8.v),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildSeven(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => RealTimeModel()));
          },
          backgroundColor: appTheme.teal600,

          child: CustomImageView(
            imagePath: ImageConstant.imgCamera,
            height: 25.0.v,
            width: 25.0.h,
          ),

        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  /// Section Widget
  Widget _buildSeven(BuildContext context) {
    return CustomBottomAppBar(
      onChanged: (BottomBarEnum type) {},
    );
  }
}



