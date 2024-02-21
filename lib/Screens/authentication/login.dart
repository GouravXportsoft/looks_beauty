import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:looks_beauty/Screens/authentication/signUp.dart';
import 'package:looks_beauty/Screens/tabBar_Screen.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';
import 'package:looks_beauty/constants/string_constant.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  String? name = '';

  bool changebutton = false;

  bool isFinished = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  // final RoundedLoadingButtonController roundedController =
  //     RoundedLoadingButtonController();
  late AnimationController _controller;
  late Animation<double> _animation;

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Future<User?> _handleGoogleSignIn() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     if (googleUser == null) return null;

  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     final UserCredential authResult =
  //         await _auth.signInWithCredential(credential);
  //     return authResult.user;
  //   }

  //  on PlatformException catch (e) {
  //   if (e.code = 'sign_in_failed' &&
  //       e.details == 'com.google.android.gms.common.api.ApiException: 10') {
  //     print('Google Sign-In was canceled by the user.');
  //   }
  // }
  //   catch (e) {
  //     print("Error during Google Sign-In: $e");
  //     return null;
  //   }
  // }

  // Future<User?> _handleAppleSignIn() async {
  //   try {
  //     final AuthorizationCredentialAppleID appleCredential =
  //         await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName
  //       ],
  //     );

  //     final AuthCredential credential = OAuthProvider("apple.com").credential(
  //       idToken: String.fromCharCodes(
  //           appleCredential.identityToken as Iterable<int>),
  //       accessToken: String.fromCharCodes(
  //           appleCredential.authorizationCode as Iterable<int>),
  //     );

  //     final UserCredential authResult =
  //         await _auth.signInWithCredential(credential);
  //     return authResult.user;
  //   } catch (e) {
  //     print("Error during Apple Sign-In: $e");
  //     return null;
  //   }
  // }

  moveToNextScreen(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changebutton = false;
        // setSharedPref(true);
      });
      Future.delayed(const Duration(seconds: 1));
      _formKey.currentState?.save();

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const TabBarScreen()));
    }
  }

  bool _isGmail(String email) {
    return email.endsWith('@gmail.com');
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TabBarScreen()));
                      },
                      child: const Text(
                        "SKIP",
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * .06),
                child: Center(
                  child: ScaleTransition(
                    scale: _animation,
                    child: Image.asset(
                      applogoImage,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * .08),
                child: Column(
                  children: [
                    ScaleTransition(
                      scale: _animation,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10)
                              ],
                              validator: (value) {
                                if (value?.length != 10) {
                                  return 'Please enter a valid phone number';
                                }

                                return null;
                              },
                              onChanged: (value) {
                                name = value;
                                setState(() {});
                              },
                              onSaved: (newValue) {
                                // userModelClass.Number = int.tryParse('$newValue');
                              },
                              controller: emailController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: 'Enter your phone number',
                                  hintStyle:
                                      const TextStyle(color: hintTextColor),
                                  contentPadding: const EdgeInsets.all(5),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: baseColor),
                                      borderRadius: BorderRadius.circular(12)),
                                  prefixIcon: const Icon(
                                    Icons.phone,
                                    color: baseColor,
                                  )),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            // TextFormField(
                            //   validator: (value) =>
                            //       value!.length < 8 || value.length > 16
                            //           ? 'Password should be 8-16 characters.'
                            //           : null,
                            //   onChanged: (value) {
                            //     name = value;
                            //     _isValid = _formKey.currentState!.validate();
                            //     setState(() {});
                            //   },
                            //   onSaved: (newValue) {
                            //     // userModelClass.Number = int.tryParse('$newValue');
                            //   },
                            //   controller: passController,
                            //   keyboardType: TextInputType.text,
                            //   decoration: InputDecoration(
                            //       label: const Text(
                            //         passText,
                            //         style: TextStyle(color: baseColor),
                            //       ),
                            //       hintText: passHintText,
                            //       hintStyle:
                            //           const TextStyle(color: hintTextColor),
                            //       contentPadding: const EdgeInsets.all(5),
                            //       border: OutlineInputBorder(
                            //           borderSide: const BorderSide(),
                            //           borderRadius: BorderRadius.circular(12)),
                            //       prefixIcon: const Icon(
                            //         Icons.lock,
                            //         color: baseColor,
                            //       )),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => VerifyEmail()));
                    //   },
                    //   child: const Padding(
                    //     padding: EdgeInsets.only(top: 10),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.end,
                    //       children: [
                    //         Text(
                    //           forgotText,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'or',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              // InkWell(
              //   onTap: () async {
              //     // User? user = await _handleGoogleSignIn();
              //     // if (user != null) {
              //     //   print(
              //     //       'Google Sign-In successful. User: ${user.displayName}');
              //     //   Navigator.push(
              //     //       context,
              //     //       MaterialPageRoute(
              //     //           builder: ((context) => const BottomBar())));
              //     // } else {
              //     //   print('Google Sign-In failed.');
              //     // }
              //   },
              //   child: Container(
              //     height: 40,
              //     width: size.width / 1.9,
              //     decoration: BoxDecoration(
              //         border: Border.all(width: 1),
              //         borderRadius: BorderRadius.circular(10)),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         Image.asset(
              //           '${googleImage}',
              //           scale: size.height * .0099,
              //           fit: BoxFit.fill,
              //         ),
              //         // Text(
              //         //   'Sign in with Google',
              //         //   style: TextStyle(
              //         //       fontWeight: FontWeight.w500, fontSize: 17),
              //         // )
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      // User? user = await _handleGoogleSignIn();
                      // if (user != null) {
                      //   print(
                      //       'Google Sign-In successful. User: ${user.displayName}');
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: ((context) => const BottomBar())));
                      // } else {
                      //   print('Google Sign-In failed.');
                      // }
                    },
                    icon: Image.asset(
                      googleImage,
                      scale: size.height * .009,
                      fit: BoxFit.fill,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      // User? user = await _handleGoogleSignIn();
                      // if (user != null) {
                      //   print(
                      //       'Google Sign-In successful. User: ${user.displayName}');
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: ((context) => const BottomBar())));
                      // } else {
                      //   print('Google Sign-In failed.');
                      // }
                    },
                    icon: Image.asset(
                      appleImage,
                      scale: size.height * .006,
                      fit: BoxFit.fill,
                    ),
                  ),

                  // Container(
                  //   height: 40,
                  //   width: size.width / 1.9,
                  //   decoration:
                  //       BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  //   child: SignInWithAppleButton(
                  //     onPressed: () async {
                  //       User? user = await _handleAppleSignIn();
                  //       if (user != null) {
                  //         print(
                  //             'Apple Sign-In successful. User: ${user.displayName}');
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: ((context) => const HomePage())));
                  //       } else {
                  //         print('Apple Sign-In failed.');
                  //       }

                  //       SignInWithAppleButtonStyle.whiteOutlined;
                  //     },
                  //   ),
                  // ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Image.asset(
                  //     'assets/apple.png',
                  //     scale: size.height * .019,
                  //     fit: BoxFit.fill,
                  //   ),
                  // ),
                ],
              ),
              const Text(accText),
              // Padding(
              //   padding: const EdgeInsets.only(top: 15),
              //   child: ScaleTransition(
              //       scale: _animation,
              //       child: RoundedLoadingButton(
              //         resetAfterDuration: true,
              //         resetDuration: const Duration(milliseconds: 1000),
              //         color: baseColor,
              //         onPressed: () {
              //           showDialog(
              //               context: context,
              //               builder: (context) => AlertDialog(
              //                     title: const Text(
              //                       'OTP Verification',
              //                       style: TextStyle(
              //                         color: baseColor,
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 18,
              //                       ),
              //                     ),
              //                     content: Column(
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.center,
              //                       mainAxisSize: MainAxisSize.min,
              //                       children: [
              //                         const Text('Enter OTP Code'),
              //                         const SizedBox(
              //                           height: 20,
              //                         ),
              //                         Form(
              //                             key: _formKey1,
              //                             child: TextFormField(
              //                               validator: (value) {
              //                                 if (value?.length != 6) {
              //                                   return 'Please enter a valid otp';
              //                                 }

              //                                 return null;
              //                               },
              //                               onChanged: (value) {
              //                                 name = value;
              //                                 _isValid = _formKey1.currentState!
              //                                     .validate();
              //                                 setState(() {});
              //                               },
              //                               onSaved: (newValue) {
              //                                 // userModelClass.Number = int.tryParse('$newValue');
              //                               },
              //                               keyboardType: TextInputType.number,
              //                               decoration: InputDecoration(
              //                                   enabledBorder:
              //                                       OutlineInputBorder(
              //                                           borderRadius:
              //                                               BorderRadius
              //                                                   .circular(10)),
              //                                   contentPadding:
              //                                       const EdgeInsets.all(8),
              //                                   focusedBorder:
              //                                       OutlineInputBorder(
              //                                           borderRadius:
              //                                               BorderRadius
              //                                                   .circular(10)),
              //                                   label: const Text('Enter OTP')),
              //                             ))
              //                       ],
              //                     ),
              //                     actions: [
              //                       TextButton(
              //                           onPressed: () {
              //                             moveToNextScreen(context);
              //                           },
              //                           child: const Text(
              //                             'Sumbit',
              //                             style: TextStyle(color: baseColor),
              //                           ))
              //                     ],
              //                   ));
              //         },
              //         controller: roundedController,
              //         successColor: baseColor,
              //         child: const Center(
              //           child: Text('send otp',
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.bold,
              //                 // fontFamily: GoogleFonts.roboto().fontFamily),
              //               )),
              //         ),
              //       )),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SwipeableButtonView(
                    disableColor: Colors.amber,
                    onFinish: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TabBarScreen()));
                      setState(() {
                        isFinished = false;
                      });
                    },
                    isFinished: isFinished,
                    onWaitingProcess: () {
                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          isFinished = true;
                        });
                      });
                    },
                    activeColor: baseColor,
                    buttonWidget: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xffA8763F),
                    ),
                    buttonText: 'Slide to Send OTP'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SingUpScreen()));
                  },
                  child: RichText(
                      text: const TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(color: Colors.black),
                          children: [
                        TextSpan(
                            // recognizer: TapGestureRecognizer()
                            //   ..onTap = () {
                            //     Navigator.pop(context);
                            //   },
                            text: '  SignUp',
                            style: TextStyle(
                                fontSize: 15,
                                color: baseColor,
                                fontWeight: FontWeight.bold))
                      ])),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  // setSharedPref(bool isGuest) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool("isGuest", isGuest);
  // }
}
