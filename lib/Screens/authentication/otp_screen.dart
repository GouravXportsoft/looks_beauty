// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:looks_beauty/Screens/home_screen.dart';
import 'package:looks_beauty/Screens/tabBar_Screen.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';
import 'package:looks_beauty/routes/routes.dart';
import 'package:pinput/pinput.dart';

import 'package:swipeable_button_view/swipeable_button_view.dart';

class OtpScreen extends StatefulWidget {
  // final String verificationId;
  // final String phoneNumber;

  const OtpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isValid = false;
  var code = '';
  bool isFinished = false;
  bool loading = false;
  bool isLoading = false;
  late Timer countdownTimer;
  int resendTime = 60;

  startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resendTime = resendTime - 1;
      });
      if (resendTime < 1) {
        stopTimer();
      }
    });
  }

  stopTimer() {
    if (countdownTimer.isActive) {
      countdownTimer.cancel();
    }
  }

  @override
  void initState() {
    startTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    // final homeProvider = Provider.of<HomeProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Image.asset(applogoImage, scale: 8),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter OTP Code',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: .4),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Form(
                              key: _formKey,
                              child: Pinput(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return '';
                                  } else if (value.length < 6) {
                                    return '';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: otpController,
                                showCursor: false,
                                focusedPinTheme: PinTheme(
                                    height: 48,
                                    width: 48,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            style: BorderStyle.solid,
                                            color: base3Color),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16)))),
                                defaultPinTheme: PinTheme(
                                    textStyle:
                                        const TextStyle(color: bottomBarColor),
                                    height: (width - 16) / 8,
                                    width: (width - 16) / 8,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            style: BorderStyle.solid,
                                            color: bottomBarColor),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)))),
                                length: 6,
                                onChanged: (value) {
                                  code = value;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // GestureDetector(
                          //   onTap: () async {
                          //     // try {
                          //     //   // homeProvider.showLoader();
                          //     //   // PhoneAuthCredential cred =
                          //     //   //     PhoneAuthProvider.credential(
                          //     //   //         // verificationId: widget.verificationId,
                          //     //   //         smsCode: otpController.text.toString());
                          //     //   FirebaseAuth.instance
                          //     //       .signInWithCredential(cred)
                          //     //       .then((value) => {
                          //     //             stopTimer(),
                          //     //             // DatabaseProvider().insertUser(UserModel(
                          //     //             //     name:
                          //     //             //         value.user?.displayName ?? "User",
                          //     //             //     email: value.user?.email ?? "",
                          //     //             //     phoneNumber: phoneNumber)),
                          //     //             // homeProvider.hideLoader(),
                          //     //             setState(() {
                          //     //               isLoading = false;
                          //     //             }),
                          //     //             Navigator.pushReplacementNamed(
                          //     //                 context, tabsRoute)
                          //     //           })
                          //     //       .catchError((e) {
                          //     //     SnackBar snackBar = const SnackBar(
                          //     //         content:
                          //     //             Text('The OTP you provide is Invalid'));
                          //     //     ScaffoldMessenger.of(context)
                          //     //         .showSnackBar(snackBar);
                          //     //     return {false};
                          //     //   });
                          //     // } catch (e) {
                          //     //   const snackBar = SnackBar(
                          //     //     content:
                          //     //         Text('Something went wrong, try again later'),
                          //     //   );
                          //     //   ScaffoldMessenger.of(context)
                          //     //       .showSnackBar(snackBar);
                          //     // }
                          //   },
                          //   child: Container(
                          //     margin: const EdgeInsets.only(top: 20),
                          //     width: double.infinity,
                          //     padding: const EdgeInsets.symmetric(vertical: 12),
                          //     decoration: const BoxDecoration(
                          //         // color: bottomBarColor,
                          //         gradient: LinearGradient(
                          //             colors: [
                          //               baseColor,
                          //               base3Color,
                          //             ],
                          //             begin: Alignment.bottomRight,
                          //             end: Alignment.topLeft),
                          //         borderRadius:
                          //             BorderRadius.all(Radius.circular(30))),
                          //     child: isLoading
                          //         ? Center(
                          //             child: const CircularProgressIndicator(
                          //             color: Colors.white,
                          //           ))
                          //         : const Text(
                          //             'Verify',
                          //             style: TextStyle(
                          //                 color: Colors.white,
                          //                 fontSize: 15,
                          //                 fontWeight: FontWeight.bold),
                          //             textAlign: TextAlign.center,
                          //           ),
                          //   ),
                          // ),
                          SwipeableButtonView(
                              onFinish: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TabBarScreen()));
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
                              buttonWidget: Container(
                                child: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xffA8763F),
                                ),
                              ),
                              buttonText: 'Slide to Verify OTP'),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 32),
                        child: Text(
                          "termsText",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            resendTime == 0
                ? Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      onTap: () async {
                        // homeProvider.showLoader();
                        // resendOtp();
                        // homeProvider.hideLoader();
                      },
                      child: const Text(
                        'Resend OTP',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          color: bottomBarColor,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            resendTime != 0
                ? Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'You can resend OTP after $resendTime second(s)',
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Nuntio',
                          fontWeight: FontWeight.bold,
                          color: base2Color),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
