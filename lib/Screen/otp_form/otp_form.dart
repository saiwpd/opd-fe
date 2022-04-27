import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:appname/Models/Sign_In/Sign_In.dart';
import '../../Bloc/OTP_Bloc/otp_bloc.dart';
import '../../Service/Sign_In/Sign_In.dart';
import '../../SharedWidget/app_loading.dart';
import '../../routing_constants.dart';

class Otp_form extends StatefulWidget {
  String data;
  Otp_form({Key? key, required this.data}) : super(key: key);
  // OtpExp data;
  // Otp_form({
  //   Key? key,
  // }) : super(key: key);

  @override
  State<Otp_form> createState() => _Otp_formState();
}

class _Otp_formState extends State<Otp_form> {
  OTPBloc bloc = OTPBloc();
  late TextEditingController controller;

  void initState() {
    super.initState();
    bloc.initPage(widget.data);
    //bloc.paymentModel.refId = widget.data.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "OTP 2FA",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: StreamBuilder(
          stream: bloc.getDataController.stream,
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              if (!snapshot.hasError) {
                return SingleChildScrollView(
                    child: Column(children: [
                  Container(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: bloc.otpdata,
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
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                            bloc.getProfileModel.errormessege == null
                                ? ''
                                : '${bloc.getProfileModel.errormessege}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                      ],
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        primary: Color(0xffE8DEF8),
                        onPrimary: Color.fromRGBO(0, 0, 0, 1),
                        fixedSize: const Size(200, 80),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    onPressed: () {
                      bloc.otp(context);
                    },
                    child: const Text('confirm'),
                  ),
                  Container(
                    height: 20,
                  ),
                ]));
              } else {
                return AppLoaderIndicator();
              }
            } else {
              return AppLoaderIndicator();
            }
          }),
    );
  }
}
