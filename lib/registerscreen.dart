import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/homenavigation.dart';
import 'package:test_flutter/login_screen.dart';

import 'app_auth.dart';
import 'custom_text.dart';
import 'custom_textFormField.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  var EmailRegController = TextEditingController();
  var PassRegController = TextEditingController();
  var NameRegController = TextEditingController();
  var PhoneRegController = TextEditingController();
  var _formkey = GlobalKey<FormState>();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("register"),
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
                  controller: EmailRegController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This Field is required";
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
                  isVisible: isVisible,
                  prefixIconn: Icon(Icons.lock),
                  controller: PassRegController,
                  suffixIconn: InkWell(
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      child: Icon(Icons.visibility)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This Field is required";
                    }
                    return null;
                  },
                  hint: "Enter paswword",
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  data: "Name",
                  prefixIconn: Icon(Icons.person),
                  isVisible: false,
                  controller: NameRegController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This Field is required";
                    }
                    return null;
                  },
                  hint: "Enter Name",
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  data: "Phone",
                  prefixIconn: Icon(Icons.phone),
                  isVisible: false,
                  controller: PhoneRegController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This Field is required";
                    }
                    return null;
                  },
                  hint: "Enter Phone Number",
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      AppAuth.RegisterUser(
                        mail: EmailRegController.text,
                        pass: PassRegController.text,
                        name: NameRegController.text,
                        phone: PhoneRegController.text,
                        context: context,
                      );
                    }
                    setState(() {
                      EmailRegController.clear();
                      PassRegController.clear();
                      PhoneRegController.clear();
                      NameRegController.clear();
                    });
                  },
                  child: CustomText(data: "register"),
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
                              builder: (context) => LoginScreen()));
                    },
                    child: CustomText(
                      data: "Have an account? Sign in now",
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
