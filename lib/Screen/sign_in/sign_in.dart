import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Bloc/Sign_In/Sign_In.dart';
import '../../Service/Sign_In/Sign_In.dart';
import '../../SharedWidget/app_loading.dart';
import '../../routing_constants.dart';

class Sign_in extends StatefulWidget {
  Sign_in({Key? key}) : super(key: key);

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  SignInBloc bloc = SignInBloc();
  late TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text(
            "Sign in",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: bloc.username,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  hintText: 'Enter Username',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.blue)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.blue)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.red)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.red))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: bloc.password,
              obscureText: true,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.vpn_key,
                    color: Colors.blue,
                  ),
                  hintText: 'Enter Password',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.blue)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.blue)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.red)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.red))),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                primary: Color(0xffE8DEF8),
                onPrimary: Colors.black,
                fixedSize: const Size(200, 80),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            onPressed: () {
              bloc.signIn(context);
              // Navigator.pushNamed(context, otp_form);
            },
            child: const Text('Sign in'),
          ),
          Container(
            height: 20,
          ),
        ])));
  }
}
