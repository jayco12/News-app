import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/clientauthentication.dart';
import '../components/validator.dart';
import '../constants.dart';
import '../controllers/login.controller.dart';
import '../route/route.name.dart';
import '../services/authentication.dart';
import '../widgets/custom.text.dart';
import '../widgets/custom.textfield.dart';
import '../widgets/custom_button.dart';
import 'bottom_navigator.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController loginController = Get.put(LoginController());
  bool _isChecked = false;
  final _authClient = AuthenticationClient();
  final _formKey = GlobalKey<FormState>();

  bool _isProgress = false;
  bool _isSigningIn = false;
  @override
  void initState() {
    _loadUserEmailPassword();
    super.initState();
  }

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
                          text: "Log in",
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
                        height: 20,
                      ),
                      CustomTextField(
                        label: 'Email Adress',
                        controller: loginController.emailAddress,
                        hint: "Email Address",
                        validator: Validator.email,
                        inputType: kEmailInput,
                        inputFormat: kEmailFormatter,
                      ),
                      SizedBox(height: 26.h),
                      CustomTextField(
                        label: 'Password',
                        validator: Validator.password,
                        controller: loginController.password,
                        hint: "Password",
                        inputType: kEmailInput,
                        inputFormat: kEmailFormatter,
                      ),
                      SizedBox(height: 46.h),
                      _isProgress
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: double.maxFinite,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      _isProgress = true;
                                    });
                                    final User? user =
                                        await _authClient.loginUser(
                                      email: loginController.emailAddress.text,
                                      password: loginController.password.text,
                                      context: context,
                                    );
                                    setState(() {
                                      _isProgress = false;
                                    });

                                    if (user != null) {
                                      Get.to(() => BottomNavigator(user: user));
                                    }
                                  }
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: CustomText(
                                    text: "Log in",
                                    colour: AppColours.primaryWhite,
                                    weight: kFW400,
                                    size: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                      TextButton(
                        onPressed: () {},
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                                color: Color.fromARGB(211, 134, 131, 131)),
                          ),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 24.0,
                                width: 24.0,
                                child: Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor:
                                          const Color(0xff00C8E8) // Your color
                                      ),
                                  child: Checkbox(
                                      activeColor: const Color(0xff00C8E8),
                                      value: _isChecked,
                                      onChanged: _handleRememberme),
                                )),
                            const SizedBox(width: 10.0),
                            const Text("Remember Me",
                                style: TextStyle(
                                    color: Color(0xff646464),
                                    fontSize: 12,
                                    fontFamily: 'Rubic'))
                          ]),
                      SizedBox(height: 114.h),
                      RichText(
                          text: TextSpan(children: [
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
                      ])),
                      Text(
                        " Dont Have An Account? ",
                        style: GoogleFonts.lato(
                          fontSize: 14.sp,
                          fontWeight: kFW400,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(RouteName.signup);
                        },
                        child: Text(
                          " Sign up ",
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

  void _handleRememberme(bool? value) {
    if (value == null) return;
    if (kDebugMode) {
      print("Handle Rember Me");
    }
    _isChecked = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', loginController.emailAddress.text);
        prefs.setString('password', loginController.password.text);
      },
    );
    setState(() {
      _isChecked = value;
    });
  }

  void _loadUserEmailPassword() async {
    if (kDebugMode) {
      print("Load Email");
    }
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;

      if (kDebugMode) {
        print(_remeberMe);
      }
      if (kDebugMode) {
        print(_email);
      }
      if (kDebugMode) {
        print(_password);
      }
      if (_remeberMe) {
        setState(() {
          _isChecked = true;
        });
        loginController.emailAddress.text = _email;
        loginController.password.text = _password;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
