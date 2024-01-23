import 'package:flutter/material.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';
import 'package:looks_beauty/constants/string_constant.dart';
import 'package:looks_beauty/routes/routes.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail>
    with SingleTickerProviderStateMixin {
  final RoundedLoadingButtonController roundedController =
      RoundedLoadingButtonController();
  late AnimationController _controller;
  late Animation<double> _animation;

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

  final _formKey = GlobalKey<FormState>();
  bool _isGmail(String email) {
    return email.endsWith('@gmail.com');
  }

  String? name = '';
  final TextEditingController emailController = TextEditingController();
  bool changebutton = false;

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
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
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
            SizedBox(
              height: 10,
            ),
            ScaleTransition(
              scale: _animation,
              child: const Center(
                  child: Text(verifyEmailText,
                      style: TextStyle(
                          color: baseColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 19))),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * .08),
              child: ScaleTransition(
                scale: _animation,
                child: Form(
                  key: _formKey,
                  child: TextFormField(
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
                        hintStyle: const TextStyle(color: hintTextColor),
                        contentPadding: const EdgeInsets.all(5),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(),
                            borderRadius: BorderRadius.circular(12)),
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: baseColor,
                        )),
                  ),
                ),
              ),
            ),
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
                      child: Text("Send Code",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            // fontFamily: GoogleFonts.roboto().fontFamily),
                          )),
                    ),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
