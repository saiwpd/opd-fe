import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Otp_form extends StatefulWidget {
  Otp_form({Key? key}) : super(key: key);

  @override
  State<Otp_form> createState() => _Otp_formState();
}

class _Otp_formState extends State<Otp_form> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text(
            "OTP 2FA",
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
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Enter OTP',
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
              Navigator.pushNamed(context, menu);
            },
            child: const Text('confirm'),
          ),
          Container(
            height: 20,
          ),
        ])));
  }
}
