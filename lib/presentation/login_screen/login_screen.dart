import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:person_identifier_application/presentation/sign_up_screen/sign_up_screen.dart';
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

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

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
                  top: 150.v,
                  right: 20.h,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Welcome Back !",
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    SizedBox(height: 7.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Please login to continue in the app.",
                        style: CustomTextStyles.titleMediumPrimary16,
                      ),
                    ),
                    SizedBox(height: 41.v),
                    reusableTextField("Enter UserName", Icons.person_outline,
                        false, _emailTextController),
                    /*CustomTextFormField(
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
                    ),*/
                    SizedBox(height: 10.v),
                    reusableTextField("Enter Password", Icons.lock_outline,
                        true, _passwordTextController),
                    /*CustomTextFormField(
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
                    ),*/

                    SizedBox(height: 38.v),
                    signInSignUpButton(context, true, () {
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text).then((value) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreenTemporaryPage()));
                      });
                    }),
                    SizedBox(height: 17.v),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Didn’t have any account? ",
                            style: theme.textTheme.bodyMedium,
                          ),
                          TextSpan(
                            text: "Sign Up here",
                            style: CustomTextStyles.titleSmallff0acf83.copyWith(
                              decoration: TextDecoration.underline,
                              color: Colors
                                  .blue, // Add a blue color for visual distinction
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigate to SignupScreen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
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
}
