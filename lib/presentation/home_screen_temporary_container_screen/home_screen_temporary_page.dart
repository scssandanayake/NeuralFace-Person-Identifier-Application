import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:person_identifier_application/widgets/app_bar/custom_app_bar.dart';
import 'package:person_identifier_application/widgets/app_bar/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:person_identifier_application/core/app_export.dart';

import '../../RecognitionScreen.dart';
import '../../RegistrationScreen.dart';
import '../../widgets/custom_bottom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_floating_button.dart';



class HomeScreenTemporaryPage extends StatefulWidget {
  const HomeScreenTemporaryPage({super.key});

  @override
  State<HomeScreenTemporaryPage> createState() => _HomeScreenTemporaryPageState();
}

class _HomeScreenTemporaryPageState extends State<HomeScreenTemporaryPage> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;
  String? _name;
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
        _profilePicUrl = userData['profilePicUrl'];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 20.v,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.all(5.h),
                  decoration: AppDecoration.fillTeal.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder17,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _profilePicUrl != null
                          ? CircleAvatar(
                        backgroundImage: NetworkImage(_profilePicUrl!),
                        radius: 25,
                      )
                          : CircleAvatar(
                        radius: 25,
                        child: Icon(Icons.person),),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.h,
                          vertical: 4.v,
                        ),
                        child: Text(
                          "$_name",
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              Padding(
                padding: EdgeInsets.only(top: 200.0), // Adjust top padding as needed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 45.v),
                                     SizedBox(height: 45.v),
                    CustomElevatedButton(
                      text: "Register",
                      margin: EdgeInsets.symmetric(horizontal: 30.h),
                      alignment: Alignment.center,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => const RegistrationScreen()));
                        /*onPressed: _editProfile,*/
                      }),
                    SizedBox(height: 33.v),
                    CustomElevatedButton(
                      text: "Recognize",
                      margin: EdgeInsets.symmetric(horizontal: 30.h),
                      alignment: Alignment.center,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const RecognitionScreen()));
                      },
                      /*onPressed: _editProfile,*/
                    ),
                  ],
                ),
              ),
              /*onPressed: _editProfile,*/

              SizedBox(height: 23.v),

              SizedBox(height: 45.v),

            ],
          ),
        ),
        bottomNavigationBar: _buildSeven(context),
        floatingActionButton: CustomFloatingButton(
          height: 50,
          width: 50,
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
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "NeuralFace",
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



