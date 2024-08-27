import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/custom_text.dart';
import 'package:test_flutter/custom_textFormField.dart';
import 'package:test_flutter/homenavigation.dart';
import 'package:test_flutter/registerscreen.dart';

import 'app_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var EmailController = TextEditingController();
  var PassController = TextEditingController();
  var _formkey = GlobalKey<FormState>();
  bool isVisible = true;
  var icon = Icon(Icons.visibility);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  data: "Email",
                  prefixIconn: Icon(Icons.mail),
                  isVisible: false,
                  controller: EmailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                  hint: "Enter Email",
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  data: "Password",
                  prefixIconn: icon,
                  suffixIconn: InkWell(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Icon(Icons.visibility),
                  ),
                  isVisible: isVisible,
                  controller: PassController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                  hint: "Enter paswword",
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      await AppAuth.SignInUser(
                          mail: EmailController.text,
                          pass: PassController.text,
                          context: context);
                    }
                    setState(() {
                      EmailController.clear();
                      PassController.clear();
                    });
                  },
                  child: CustomText(data: "Login"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Registerscreen()));
                    },
                    child: CustomText(
                      data: "Don't have an account? Register now",
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
