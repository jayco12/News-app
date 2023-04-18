import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/clientauthentication.dart';
import '../components/validator.dart';
import '../constants.dart';
import '../controllers/signup.controller.dart';
import '../route/route.name.dart';
import '../services/authentication.dart';
import '../widgets/custom.text.dart';
import '../widgets/custom.textfield.dart';
import '../widgets/custom_button.dart';
import 'bottom_navigator.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpController signUpController = Get.put(SignUpController());

  final _authClient = AuthenticationClient();
  final _formKey = GlobalKey<FormState>();

  bool _isProgress = false;
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.primaryWhite,
      body: kUnfocus(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 37.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText(
                          text: "Sign up",
                          colour: AppColours.primaryBlack,
                          weight: FontWeight.w700,
                          size: 24.sp,
                        ),
                      ),
                      SizedBox(height: 21.88.h),
                      _isSigningIn
                          ? const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : OutlinedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                setState(() {
                                  _isSigningIn = true;
                                });

                                User? user =
                                    await Authentication.signInWithGoogle(
                                        context: context);

                                setState(() {
                                  _isSigningIn = false;
                                });

                                if (user != null) {
                                  Get.to(() => BottomNavigator(user: user));
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("images/logos_google-icon.png"),
                                    SizedBox(width: 19.77.w),
                                    InkWell(
                                      onTap: () {},
                                      child: CustomText(
                                        text: "Sign up with Google",
                                        colour: AppColours.primaryBlack,
                                        weight: kFW400,
                                        size: 16.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 500.w,
                        child: Divider(
                          color: AppColours.primaryBlack,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              label: 'Name',
                              controller: signUpController.name,
                              hint: "Name",
                              inputType: kEmailInput,
                              inputFormat: kEmailFormatter,
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              label: 'Email Adress',
                              controller: signUpController.emailAddress,
                              validator: Validator.email,
                              hint: "Email Address",
                              inputType: kEmailInput,
                              inputFormat: kEmailFormatter,
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              validator: Validator.password,
                              label: 'Password',
                              controller: signUpController.password,
                              hint: "Password",
                              inputType: kEmailInput,
                              inputFormat: kEmailFormatter,
                            ),
                            SizedBox(height: 16.h),
                            SizedBox(height: 38.h),
                            _isProgress
                                ? const CircularProgressIndicator()
                                : SizedBox(
                                    width: double.maxFinite,
                                    child: CustomButton(
                                      onclick: () async {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            _isProgress = true;
                                          });
                                          final User? user =
                                              await _authClient.registerUser(
                                            name: signUpController.name.text,
                                            email: signUpController
                                                .emailAddress.text,
                                            password:
                                                signUpController.password.text,
                                          );
                                          setState(() {
                                            _isProgress = false;
                                          });

                                          if (user != null) {
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    BottomNavigator(
                                                  user: user,
                                                ),
                                              ),
                                              (route) => false,
                                            );
                                          }
                                        }
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: CustomText(
                                          text: "Sign Up",
                                          colour: AppColours.primaryWhite,
                                          weight: kFW400,
                                          size: 16.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      SizedBox(height: 34.h),
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: SizedBox(
                                width: 114.w,
                                child: Divider(
                                  color: AppColours.primaryBlack,
                                ),
                              ),
                            ),
                            WidgetSpan(
                              child: SizedBox(
                                width: 114.w,
                                child: Divider(
                                  color: AppColours.primaryBlack,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        " Already have an Account? ",
                        style: GoogleFonts.lato(
                          fontSize: 14.sp,
                          fontWeight: kFW400,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(RouteName.login);
                        },
                        child: Text(
                          " Log in ",
                          style: GoogleFonts.lato(
                            fontSize: 14.sp,
                            fontWeight: kFW400,
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
