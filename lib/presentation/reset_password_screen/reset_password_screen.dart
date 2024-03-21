import 'package:person_identifier_application/widgets/app_bar/custom_app_bar.dart';
import 'package:person_identifier_application/widgets/app_bar/appbar_title.dart';
import 'package:person_identifier_application/widgets/custom_text_form_field.dart';
import 'package:person_identifier_application/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:person_identifier_application/core/app_export.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailController = TextEditingController();

  TextEditingController newpasswordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

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
                  top: 112.v,
                  right: 20.h,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Reset Your Password",
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    SizedBox(height: 7.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Please add a new password to continue.",
                        style: CustomTextStyles.titleMediumPrimary16,
                      ),
                    ),
                    SizedBox(height: 41.v),
                    _buildEmail(context),
                    SizedBox(height: 10.v),
                    _buildNewpassword(context),
                    SizedBox(height: 10.v),
                    _buildConfirmpassword(context),
                    SizedBox(height: 40.v),
                    _buildUpdatePassword(context),
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
      title: AppbarTitle(
        text: "NeuralFace",
      ),
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
  Widget _buildNewpassword(BuildContext context) {
    return CustomTextFormField(
      controller: newpasswordController,
      hintText: "New Password",
      hintStyle: theme.textTheme.titleSmall!,
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
  Widget _buildConfirmpassword(BuildContext context) {
    return CustomTextFormField(
      controller: confirmpasswordController,
      hintText: "Confirm Password",
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
  Widget _buildUpdatePassword(BuildContext context) {
    return CustomElevatedButton(
      text: "Update Password",
      margin: EdgeInsets.symmetric(horizontal: 10.h),
    );
  }
}
