import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:person_identifier_application/widgets/app_bar/custom_app_bar.dart';
import 'package:person_identifier_application/widgets/app_bar/appbar_title.dart';
import 'package:person_identifier_application/widgets/custom_outlined_button.dart';
import 'package:person_identifier_application/widgets/custom_text_form_field.dart';
import 'package:person_identifier_application/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:person_identifier_application/core/app_export.dart';

import '../../home_screen.dart';
import '../../reuseable_widget/reusable_widget.dart';
import '../home_screen_temporary_container_screen/home_screen_temporary_page.dart';
import '../person_details_screen/person_details_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _IDTextController = TextEditingController();
  final TextEditingController _roleTextController = TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(1, 0),
              end: Alignment(0, 0.99),
              colors: [
                appTheme.lime100,
                theme.colorScheme.onPrimary,
                appTheme.teal200,
              ],
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  left: 20.h,
                  top: 100.v,
                  right: 20.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome To Nuralface!",
                      style: theme.textTheme.titleLarge,
                    ),
                    SizedBox(height: 5.v),
                    Text(
                      "Please create an account to continue.",
                      style: CustomTextStyles.titleMediumPrimary16,
                    ),
                    SizedBox(height: 10.v),
                    reusableTextField("Enter Email", Icons.email_outlined,
                        false, _emailTextController),
                    SizedBox(height: 10.v),
                    reusableTextField("Enter Password", Icons.password_outlined,
                        true, _passwordTextController),
                    SizedBox(height: 10.v),
                    reusableTextField("Enter Name", Icons.abc_outlined,
                        false, _nameTextController),
                    SizedBox(height: 10.v),
                    reusableTextField("Enter ID",Icons.numbers_outlined,
                        false, _IDTextController),
                    SizedBox(height: 10.v),
                    reusableTextField("Enter Role",Icons.person_outline,
                        false, _roleTextController),
                    SizedBox(height: 10.v),
                    reusableTextField("Enter Phone No",Icons.book_outlined,
                        false, _phoneTextController),

                    SizedBox(height: 10.v),
                    signInSignUpButton(context, false, () async {
                      final UserCredential userCredential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text);

                      if (userCredential.user != null) {
                        print("Created New Account");

                        // Create a new user document in Firestore (assuming you have the code)
                        if (userCredential.user != null) {
                          // user creation was successful, proceed with setting user data
                          final User user = userCredential.user!;

                          await _firestore.collection('users').doc(user.uid).set({
                            'name': _nameTextController.text,
                            'email': _emailTextController.text,
                            'ID': _IDTextController.text,
                            'role': _roleTextController.text,
                            'phone': _phoneTextController.text,
                          });
                        }

                        final User user = userCredential.user!; // Extract the actual User object
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreenTemporaryPage()),
                        );
                      } else {
                        print("Error creating account"); // Handle the error appropriately
                      }
                    }),


                    SizedBox(height: 20.v),


                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(top: 40.0), // Adjust the top padding as needed
        child: AppbarTitle(
          text: "NeuralFace",
        ),
      ),
    );
  }

 /* /// Section Widget
  Widget _buildName(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      hintText: "Name",
      hintStyle: theme.textTheme.titleSmall!,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 15.v,
      ),
      //borderDecoration: TextFormFieldStyleHelper.outlineGray,
      filled: true,
      fillColor: theme.colorScheme.onPrimary,
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      hintText: "Email",
      hintStyle: theme.textTheme.titleSmall!,
      textInputType: TextInputType.emailAddress,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 15.v,
      ),
      //borderDecoration: TextFormFieldStyleHelper.outlineGray,
      filled: true,
      fillColor: theme.colorScheme.onPrimary,
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      hintText: "Password",
      hintStyle: theme.textTheme.titleSmall!,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      suffix: Padding(
        padding: EdgeInsets.fromLTRB(30.h, 15.v, 16.h, 14.v),
        child: Text(
          "Show",
          style: TextStyle(
            color: Color(0XFF1F8A70),
            fontSize: 15.fSize,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      suffixConstraints: BoxConstraints(
        maxHeight: 50.v,
      ),
      obscureText: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 15.v,
      ),
      //borderDecoration: TextFormFieldStyleHelper.outlineGray,
      filled: true,
      fillColor: theme.colorScheme.onPrimary,
    );
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return CustomOutlinedButton(
      text: "Sign Up",
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      alignment: Alignment.center,
    );
  }*/
}
