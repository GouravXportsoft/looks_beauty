import 'package:flutter/material.dart';
import 'package:looks_beauty/Screens/authentication/signUp.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';
import 'package:looks_beauty/constants/string_constant.dart';

import 'login.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({super.key});

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
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
      body: ScaleTransition(
        scale: _animation,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(frameImage),
                  opacity: 100,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.28), BlendMode.dstATop))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ScaleTransition(
                  scale: _animation,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: ScaleTransition(
                            scale: _animation,
                            child: Container(
                              height: size.height * .06,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: baseColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(singInText,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,

                                      // fontFamily: GoogleFonts.roboto().fontFamily),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SingUpScreen()));
                        },
                        child: ScaleTransition(
                          scale: _animation,
                          child: Container(
                            height: size.height * .06,
                            width: size.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: baseColor,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(singupText,
                                  style: TextStyle(
                                    color: baseColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    // fontFamily: GoogleFonts.roboto().fontFamily),
                                  )),
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
        ),
      ),
    );
  }
}
