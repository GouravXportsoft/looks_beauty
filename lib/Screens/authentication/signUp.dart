import 'package:flutter/material.dart';
import 'package:looks_beauty/Screens/authentication/login.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';
import 'package:looks_beauty/constants/string_constant.dart';
import 'package:looks_beauty/routes/routes.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen>
    with SingleTickerProviderStateMixin {
  String? name = '';
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  late AnimationController _controller;
  bool changebutton = false;
  final RoundedLoadingButtonController roundedController =
      RoundedLoadingButtonController();
  late Animation<double> _animation;
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

  moveToNextScreen(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changebutton = false;
      });
      Future.delayed(const Duration(seconds: 1));
      _formKey.currentState?.save();

      Navigator.pushReplacementNamed(context, homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //     leading: IconButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         icon: const Icon(Icons.arrow_back))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                  ],
                ),
                Center(
                  child: ScaleTransition(
                    scale: _animation,
                    child: Image.asset(
                      applogoImage,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ScaleTransition(
                  scale: _animation,
                  child: const Center(
                      child: Text(createAccText,
                          style: TextStyle(
                              color: baseColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 19))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * .00),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            // Text(
                            //   'Enter Mobile Number',
                            //   style: TextStyle(fontWeight: FontWeight.bold),
                            // ),
                          ],
                        ),
                      ),
                      ScaleTransition(
                        scale: _animation,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                    label: const Text(
                                      NameText,
                                      style: TextStyle(color: baseColor),
                                    ),
                                    hintText: nameHintText,
                                    hintStyle:
                                        const TextStyle(color: hintTextColor),
                                    contentPadding: const EdgeInsets.all(5),
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      // color: baseColor,
                                    )),
                                controller: nameController,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                          .hasMatch(value)) {
                                    return 'Please enter a valid name';
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
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                // inputFormatters: [
                                //   FilteringTextInputFormatter.digitsOnly,
                                //   LengthLimitingTextInputFormatter(10)
                                // ],
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                          .hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }

                                  if (!_isGmail(value)) {
                                    return 'Please enter a valid email address';
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
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    label: const Text(
                                      emailText,
                                      style: TextStyle(color: baseColor),
                                    ),
                                    hintText: emailHintText,
                                    hintStyle:
                                        const TextStyle(color: hintTextColor),
                                    contentPadding: const EdgeInsets.all(5),
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    prefixIcon: const Icon(
                                      Icons.mail,
                                      // color: baseColor,
                                    )),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                validator: (value) =>
                                    value!.length < 8 || value.length > 16
                                        ? 'Password should be 8-16 characters.'
                                        : null,
                                onChanged: (value) {
                                  name = value;
                                  setState(() {});
                                },
                                onSaved: (newValue) {
                                  // userModelClass.Number = int.tryParse('$newValue');
                                },
                                controller: passController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    label: const Text(
                                      passText,
                                      style: TextStyle(color: baseColor),
                                    ),
                                    hintText: passHintText,
                                    hintStyle:
                                        const TextStyle(color: hintTextColor),
                                    contentPadding: const EdgeInsets.all(5),
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      // color: baseColor,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
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
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: ScaleTransition(
                      scale: _animation,
                      child: RoundedLoadingButton(
                        color: baseColor,
                        onPressed: () => moveToNextScreen(context),
                        controller: roundedController,
                        successColor: baseColor,
                        child: const Center(
                          child: Text(singupText,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                // fontFamily: GoogleFonts.roboto().fontFamily),
                              )),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: RichText(
                        text: const TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(color: Colors.black),
                            children: [
                          TextSpan(
                              // recognizer: TapGestureRecognizer()
                              //   ..onTap = () {
                              //     Navigator.pop(context);
                              //   },
                              text: singInText,
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
        ),
      ),
    );
  }
}
